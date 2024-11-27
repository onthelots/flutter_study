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

    // ✅ step2. parent widget 접근 + update UI
    // widget에 접근하게 되면, locationScreen Widget으로 접근됨
    updateUI(widget.locationWeather);
  }

  // double temperature = locationWeather['main']['temp'];
  // int condition = locationWeather['weather'][0]['id'];
  // String cityName = locationWeather['name'];

  // ✅ step3. widget에 할당된 (loading_screen으로 부터 넘어온) locationWeather를 기반으로 한 UI 업데이트 메서드
  void updateUI(dynamic weatherData) {

    // ✅ 상태변화 -> SetState()로 묶어줘야 제대로 반영!
    // weather icon
    setState(() {
      var condition = weatherData['weather'][0]['id'];
      this.weatherIcon = weatherModel.getWeatherIcon(condition);

      // temperature
      var temp = weatherData['main']['temp'];
      var tempToInt = temp.toInt();
      this.temperature = tempToInt;
      this.message = weatherModel.getMessage(tempToInt);

      // cityName
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

                  // 새로운 위치를 받아서 업데이트를 실시함
                  IconButton(
                    onPressed: () {
                      // near_me
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