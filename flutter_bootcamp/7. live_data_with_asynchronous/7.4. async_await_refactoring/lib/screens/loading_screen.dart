import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
    print('init State');
  }

  Future<void> getLocation() async {
    Location location = Location();
    await location.getLocation();
    print('latitude: ${location.latitude}');
    print('longitude: ${location.longitude}');
  }

  // ✅ deactive
  // 위젯이 파괴되기 전까지 직전의 데이터를 저장하는 용도로 활용 가능
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  // ✅ build
  // state가 변경될 때 마다 호출되므로, '위치 호출'과 같은 방식을 지속적으로 변경하는 것은 불필요
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
