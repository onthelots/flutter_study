import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

// const 분리
const String apikey = '44bf273a622da8f9df5954bd60218eb9';
const String openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  // https://openweathermap.org/current#:~:text=for%20this%20functionality.-,Built%2Din%20API%20request%20by%20city%20name,-You%20can%20call
  Future<dynamic> getCityWeather(String cityName) async {

    // url 설정
    var url = '$openWeatherMapURL?q=$cityName&appid=$apikey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  // method 1. dynamic 타입의 weatherData를 반환하는 메서드
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper('${openWeatherMapURL}?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
