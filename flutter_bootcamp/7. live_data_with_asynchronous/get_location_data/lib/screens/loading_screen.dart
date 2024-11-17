import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  // ✅ Get Location
  // package : https://pub.dev/packages/geolocator (geolocator)
  // iOS, Android 모두 활용 가능 (but, permission-승인-과정은 각각 처리해야 함)
  void getLocation() async {
    // API 호출 등 시간이 소요되는 부분을 비동기로 처리하기 위한 방식 (async, await)
    // 일단, 현재 Section에서는 위치만 받아오도록 함
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
    print(position);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          child: Text('Get Location'),
          onPressed: () {
            //Get the current location
          },
        ),
      ),
    );
  }
}
