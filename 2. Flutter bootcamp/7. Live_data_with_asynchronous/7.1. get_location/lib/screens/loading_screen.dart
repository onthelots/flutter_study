import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  // ✅ Gelocator (https://pub.dev/packages/geolocator)
  // iOS, Andorid - platform 별 위치정보 가져오기 (단, 각각의 manifest와 info.plist 내 세팅은 별로로 진행할 것)

  void getLocation() async {
    late bool serviceEnabled;
    late LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    // 비 허용일 경우
    if (permission == LocationPermission.denied) {
      // 재 요청
      permission = await Geolocator.requestPermission();

      // 재 요청 이후에도 비 허용일 경우
      if (permission == LocationPermission.denied) {
        // 에러메세지
        return Future.error('Location permissions are denied');
      }
    }

    // Forever일 경우에는
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // 최종적으로 여기까지 도달했을 땐, 허용으로 판단 (granted)
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    print('현재 내 위치는? : $position'); // Latitude, longitude (경도, 위도)로 출력됨
  }

  // 1) serviceEnabled : 서비스 자체가 가능한지 여부를 파악

  // 2) permission : 위치서비스 허용 여부 파악

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () {
            this.getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
