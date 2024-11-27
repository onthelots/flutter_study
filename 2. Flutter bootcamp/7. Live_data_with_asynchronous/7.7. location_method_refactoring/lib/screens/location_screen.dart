import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {

  // ✅ step1. passing data -> State로 전달
  late final locationWeather;

  // 해당 클래스가 초기화 될 시점에 넘겨받을 프로퍼티를 Constructor를 통해 설정
  LocationScreen({required this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  // Instance
  WeatherModel weatherModel = WeatherModel();
  // property
  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String message;

  // 부모 클래스인 LocationScreen의 속성을 받아오기 위해, initState를 실시함
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  // update UI
  void updateUI(dynamic weatherData) {
    setState(() {

      // 위치 허용을 끄거나, 서버가 다운되거나, 제대로 된 데이터를 받아오지 못했을 경우
      if (weatherData == null) {
        this.temperature = 0;
        this.weatherIcon = 'Error';
        this.message = 'Unable to get weather data';
        this.cityName = '';
        return;
      }
      var condition = weatherData['weather'][0]['id'];
      this.weatherIcon = weatherModel.getWeatherIcon(condition);

      var temp = weatherData['main']['temp'];
      var tempToInt = temp.toInt();
      this.temperature = tempToInt;
      this.message = weatherModel.getMessage(tempToInt);

      var cityName = weatherData['name'];
      this.cityName = cityName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  IconButton(
                    // async - await을 통해 현재의 위치를 다시 받아온 후 -> 날씨데이터를 새롭게 새로고침
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData); // ✅ updateUI를 다시 실시함으로서 UI 갱신을 실시함

                      // ios, android 모두 location을 새롭게 설정한 후,
                      // maps 앱에서 현재 Location의 위치를 갱신하고 나서, 다시 앱에 돌아와 위 버튼을 누르면 새롭게 갱신됨 (시뮬레이터의 한계)
                    },
                    icon: Icon(Icons.near_me),
                    iconSize: 50.0,
                  ),

                  // 도시 정보..?
                  IconButton(
                    onPressed: () {
                      // city
                    },
                    icon: Icon(Icons.location_city),
                    iconSize: 50.0,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon, // UIUpdate
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${this.message} in ${this.cityName}!", // UIUpdate
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// double temperature = decodedData['main']['temp'];
// int condition = decodedData['weather'][0]['id'];
// String cityName = decodedData['name'];