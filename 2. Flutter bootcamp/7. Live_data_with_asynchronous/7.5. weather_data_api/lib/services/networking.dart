// Fetch data from the internet(https://docs.flutter.dev/cookbook/networking/fetch-data)
// import 'package:http/http.dart' as http; (http, flutter 팀에서 만든 패키지)

import 'package:http/http.dart' as http;
import 'dart:convert'; // jsonDecode를 위한 import

class NetworkHelper{
  final String url;
  NetworkHelper(this.url);

  // ✅ http package를 활용한 API 메서드 만들기
  // https://openweathermap.org/current (openWeatherMap 활용)

  Future<dynamic> getData() async {
    // 🟢 Response (https://pub.dev/documentation/http/latest/http/Response-class.html)
    // String 형식을 Uri 형식으로 변경할 시, Uri.parse를 실시해야 함
    // 해당 http 패키에서 가져왔다는 것을 알려주기 위해, 상단 import에서 as http를 붙여주자.

    http.Response response = await http.get(
      Uri.parse(url)
    );

    if (response.statusCode == 200) {
      String data = response.body;

      // 🟢 JSON 형식 (javascript object notation)
      // {key:value} -> 마치 dart의 map형태와 유사함
      var decodeData = jsonDecode(data);

      // decode Data 반환
      return decodeData; // dynamic type 이므로, 별도로 리턴타입에 작성해주지 않아도 됨 (하지만, 명시적으로 작성해놓음)
    } else {
      print(response.statusCode);
    }
  }
}