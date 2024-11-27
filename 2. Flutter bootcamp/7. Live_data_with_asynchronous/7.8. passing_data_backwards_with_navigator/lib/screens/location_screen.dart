import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  late final locationWeather;
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

  // initState
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

  // build
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

                  // 새로고침
                  IconButton(
                    // async - await을 통해 현재의 위치를 다시 받아온 후 -> 날씨데이터를 새롭게 새로고침
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    icon: Icon(Icons.near_me),
                    iconSize: 50.0,
                  ),

                  // 도시 검색
                  IconButton(
                    onPressed: () async {
                      // ✅ push의 또 다른 의미
                      // 단순히 타겟, 즉 Route가 되는 다른 화면을 Stack에 쌓는것에 그치지 않음.
                      // Navigator.push 문서를 살펴보면..

                      // 👉🏻 'Routes can return a value'
                      // push 시, 값을 요청하면 -> pop 결과에 따라서 매개변수를 통해 값을 '반환'할 수 있는 것으로 나옴
                      // await 키워드를 사용했기 때문에, 새 화면이 닫힐 때까지 아래 코드 실행은 일시 중단되며,
                      // CityScreen이 닫힐 때(Navigator.pop) 반환된 값이 typeName 변수에 할당됨

                      // 👉🏻 Navigator.push는 일종의 [Side Effect]로서, 화면이 넘어가는 과정을 선행, 이후 데이터를 넘겨받아서 typeName에 할당함
                      var typeName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );

                      // 👉🏻 작성되어 넘어온 반환값(cityName)을 활용, 날씨 데이터 + UI Update를 실행
                      if (typeName != null) {
                        var newWeatherData = await weatherModel.getCityWeather(typeName);
                        this.updateUI(newWeatherData);
                      }
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