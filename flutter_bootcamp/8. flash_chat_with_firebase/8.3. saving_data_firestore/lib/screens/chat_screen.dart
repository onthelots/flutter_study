import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase/constants.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

final _firestore = firestore.FirebaseFirestore.instance;
late firebase_auth.User loggedInUser; // logged in user

class ChatScreen extends StatefulWidget {
  static const String identifier = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = firebase_auth.FirebaseAuth.instance;

  // ✅ TextEditingController
  // TextField에서 활용 가능. 현재 프로젝트에서는 send 이후 > 작성된 text를 삭제하는 용도로 사용.
  final messageTextController = TextEditingController();

  // property
  late String messageText; // message

  // 유저 정보 불러오기
  void getCurrentUser() async {
    // CurrentUser -> optional type
    try {
      final user = await _auth.currentUser;

      if (user != null) {
        loggedInUser = user;
        print('login Success. current user Email : ${loggedInUser.email}');
        messagesStream();
      }
    } catch (error) {
      print(error);
    }
  }

  // 🟢 Firestore 문서 가져오기 + Streams!
  // 해당 스트림 데이터를 실제 -> Widget으로 변경하기 위해선, StreamBuilder<T> Widget을 활용할 수 있음
  void messagesStream() async {
    // Future<QuerySnapshot)
    // snapshot()을 통해, 스트림을 설정한 후, 변경되는 값을 실시간으로 확인할 수 있음
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    this.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          TextButton(
              child: Text(
                'logout',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController, // textController
                      style: Theme.of(context).textTheme.bodyMedium,
                      onChanged: (value) {
                        this.messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // 🟢 Firestore 저장
                      // messageText + login=user-email
                      // collection > add (Map Type - String : dynamic)
                      _firestore.collection('messages').add({
                        'text' : this.messageText,
                        'sender' : loggedInUser.email,
                        'timestamp' : firestore.FieldValue.serverTimestamp(), // ⭐️ 메세지 타임스탬프 추가
                      });

                      messageTextController.clear(); // send 이후, 작성된 text를 clear시킬 수 있음
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ StreamBuilder
    // 1) Stream : 어디서 오는 Stream인가?
    // 2) builder : 2 input (conext, asyncSnapshot) => return Widget
    return StreamBuilder<firestore.QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('timestamp', descending: true).snapshots(),

      // ✅ Firestore 데이터 정렬 (field값 활용)
      // orderBy는 자동으로 '오름차순(오래된 순서부터 - 최근 것으로)'이 디폴트 값임.
      // 즉, 메세지의 경우 최근 것부터 - 오래된 순서로 나타나야 하니, descending을 true로 변경해야 함
      // -> 또한, ListView에서는 이를 '뒤집어'서, 하단에서부터 쌓이는 방식으로 만들면,
      // 채팅과 같이 내가 가장 최근에 작성한 메세지가 ListView의 하단에서부터 차곡차곡 쌓이게 되는 것

      // 👉🏻 snapshot : AsyncSnapshot은 firestore가 X -> Flutter snapshot O
      // 따라서, ⭐️ StreamBuilder의 타입을 정확히 <firestore.QuerySnaphot>으로 설정해줘야 함
      // 그렇게 되면, flutter snapshot을 firestore snapshot 타입으로 맞춰줄 수 있음
      builder: (context, snapshot) {

        // ⁉️ 만약 Data가 없다면?
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          )); // 데이터가 없으면 로딩 인디케이터 반환
        }

        // 👉🏻 messages collection docs
        final messages = snapshot.data?.docs;

        if (messages == null) {
          return Center(child: Text('No messages available'));
        }

        // 👉🏻 반환할 Widget
        List<MessageBubble> messageBubbles = [];

        // 👉🏻 for-in 구문을 통해, message doc(문서) 할당한 후,
        for (var message in messages) {

          // 👉🏻 get 메서드를 통해 원하는 필드의 값을 받아옴
          final messageText = message.get('text');
          final senderText = message.get('sender');

          final currentUser = loggedInUser.email; // 현재 로그인 된 내 이메일

          final messageWidget = MessageBubble(messageText: messageText, senderText: senderText, isMe: currentUser == senderText);
          messageBubbles.add(messageWidget);
        }

        // Expanded Wiget으로 감싸줌 (렌더링 영역의 최대 사이즈)
        return Expanded(
          // ✅ ListView
          child: ListView(
            reverse: true, // 스크롤 방식. true로 설정하게 되면 역순으로 표시됨. 즉 리스트의 맨 아래부터 시작하여 스크롤 하는 형태
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}


class MessageBubble extends StatelessWidget {
  final String messageText;
  final String senderText;
  final bool isMe;

  MessageBubble({required this.messageText, required this.senderText, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: this.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(senderText, style: Theme.of(context).textTheme.bodySmall),
          SizedBox(height: 3.0),
          Material(
            elevation: 5.0, // 그림자
            borderRadius: this.isMe ? BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ) :  BorderRadius.only(
              topRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            color: this.isMe ? Colors.blue : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                '$messageText',
                style: TextStyle(
                  fontSize: 15.0,
                  color: this.isMe ? Colors.white : Colors.black
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
