import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  // ✅ Gelocator
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
    // ✅ Future
    // - Future 타입을 반환하게 만든 후, 빌드하게 되면, 사실 '영수증'만 출력하는 셈
    // // flutter: 현재 내 위치는? : Instance of 'Future<Position>'
    // Future<Position> position = Geolocator.getCurrentPosition(
    //   locationSettings: LocationSettings(
    //     accuracy: LocationAccuracy.low,
    //   ),
    // );

    // ✅ await
    // 따라서, 작업이 기다리길 끝난 후, 반환받기 위해 await 키워드를 활용
    // flutter: 현재 내 위치는? : Latitude, Longitude 출력 완료
    try {
      // ✅ throw
      // 보다 명확하게, 에러의 객체를 전달할 수 있음
      // 아래와 같이 오류를 발생시킬 경우
      // somthingThatExpectsLessThan10(12);
      // error : n is greater than 10, n should always be less than 10.
      // catch 구문 내에서 발생되는 'error'란 객체(n is greater than 10 ...) 를 여기서 나타낼 수 있음


      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.low),
      );
      print('현재 내 위치는? : $position'); // Latitude, longitude (경도, 위도)로 출력됨
    }
    catch (error){
      print('error : $error');
    }
  }

  // throw keyword
  void somthingThatExpectsLessThan10(int n) {
    if (n > 10) {
      throw 'n is greater than 10, n should always be less than 10.';
    }
  }

  // ✅ initState
  // 1회만 호출됨
  @override
  void initState() {
    super.initState();

    this.getLocation();
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
