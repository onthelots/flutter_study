import 'dart:ffi';

import 'package:geolocator/geolocator.dart';

class Location {

  // property (위치정보)
  late final double latitude;
  late final double longitude;

  // method (위치정보 받아오기)
  Future<void> getLocation() async {
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
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.low),
      );
      this.longitude = position.longitude;
      this.latitude = position.longitude;
    }
    catch (error) {
      print('error : $error');
    }
  }
}