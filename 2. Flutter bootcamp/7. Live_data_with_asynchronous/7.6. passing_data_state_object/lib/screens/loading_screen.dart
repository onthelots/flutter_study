import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apikey = '44bf273a622da8f9df5954bd60218eb9';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
    print('this line of code is triggered');
  }

  // getLocationData(위치정보 및 날씨 데이터 가져오기)
  Future<void> getLocationData() async {
    Location location = Location();

    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var weatherData = await networkHelper.getData();

    // - 4) 위 작업이 모두 마무리 된 후, Location Screen으로 이동
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: weatherData)),);

    // ✅ Loading Indicator
    // 위 작업이 마무리 되는 과정이 다소 시간이 소요될 경우, 사용자들은 앱이 멈춘것 같은 경험을 받게 됨.
    // 따라서, 과정 내 로딩 인디케이터를 할당함으로서 실제로 데이터가 불러오고 있는 중이라는 것을 UX 측면에서 개선할 필요가 있음.
    // flutter_spinkit (https://pub.dev/packages/flutter_spinkit)
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
