import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  // Instance StoryBrain
  StoryBrain storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 👉🏻 decoration > BoxDecoration 활용
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/background.png"),
          fit: BoxFit.fill),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    // 👉🏻 storyBrain 내 storyNumber indexing을 통한 title 할당
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.green,
                    textStyle: TextStyle(
                      fontSize: 20.0,
                    )
                  ),
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  child: Text(
                    storyBrain.getChoice1(),
                  ),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              Expanded(
                flex: 2,

                // 👉🏻 Visibility Widget
                // hide & show 속성을 설정할 수 있음
                child: Visibility(

                  // visible 속성을 통해, true 혹은 false를 전달할 것
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.blue,
                      textStyle: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    child: Text(
                      storyBrain.getChoice2(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
