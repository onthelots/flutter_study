import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  // playSound Method
  void playSound({required int track}) {
    // ✅ AudioPlayer 생성
    final player = AudioPlayer();

    // ⭐ 로컬에 있는 Source를 재생할 땐, 경로를 assets/ 로 설정하지 않아도 됨
    // 디폴트 값으로 /assets가 잡혀있기 때문!
    // 따라서, assets/ 에 별도의 내부 폴더가 존재하지 않는다면, 그냥 파일 명만 작성할 것
    player.play(AssetSource('note${track}.wav'));
  }

  // ✅ BuildKey
  // 위젯 생성을 반복하는 것을 하나의 함수로 만들어보자
  // Widget 타입을 반환해야 함! (당연히 Widget이니까..)
  Expanded buildKey({required int track, required Color color}) {
    return Expanded(
      child: FilledButton(
          onPressed: () {
            this.playSound(track: track);
          },
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            backgroundColor: color,
          ),
          child: Container()
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              buildKey(track: 1, color: Colors.red),
              buildKey(track: 2, color: Colors.orange),
              buildKey(track: 3, color: Colors.yellow),
              buildKey(track: 4, color: Colors.green),
              buildKey(track: 5, color: Colors.blue),
              buildKey(track: 6, color: Colors.teal),
              buildKey(track: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}