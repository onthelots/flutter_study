import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[

              // ✅ back arrow
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                  iconSize: 50.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // ✅ TextField
              // search results
              // TextField Cookbook(https://docs.flutter.dev/cookbook/forms/text-input)
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,

                  // 👉🏻 onchanged -> text값이 변경되었을 경우, 트리거!
                  onChanged: (value) {
                    this.cityName = value; // changed value를 실시간으로 할당
                  },
                ),
              ),

              // search Button
              TextButton(

                // ✅ Passing Data Backwards through the Navigation Stack
                // 현재 화면에서의 데이터를, 네비게이션 스택을 활용하여 이전 화면으로 '데이터와 함께' 보내는 방식!
                onPressed: () {
                  // void pop<T extends Object?>(BuildContext context, [T? result])
                  // [pop]은, 아래와 같이 result 값 - Dynamic 타입- 을 함께 이전 화면으로 전달할 수 있음
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
