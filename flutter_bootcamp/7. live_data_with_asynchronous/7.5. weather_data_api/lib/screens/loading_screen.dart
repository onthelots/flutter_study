import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apikey = '44bf273a622da8f9df5954bd60218eb9';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
    print('this line of code is triggered');
  }

  // ✅ 위치정보 및 날씨 데이터 가져오기
  Future<void> getLocationData() async {
    Location location = Location();

    // - 1) 위치정보 가져오기
    await location.getLocation();

    // - 2) 경도 및 위도정보 할당
    this.latitude = location.latitude;
    this.longitude = location.longitude;

    // - 3) network 객체생성(NetworkHelper)  및 Weather API를 통한 dynamic 타입의 JSON 데이터 디코딩 (weatherData)
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey');
    var weatherData = await networkHelper.getData();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
