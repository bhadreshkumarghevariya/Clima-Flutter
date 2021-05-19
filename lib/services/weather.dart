import '../services/location.dart';
import '../services/networking.dart';
import 'package:clima/services/weather.dart';

const apiKey = 'c3a8954d332ec391e645c275960bfd9d';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = new NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    // print('Get Loacation Weather Called!!');
    Location location = new Location();
    await location.getCurrentLoaction();
    // print('Got location ${location.latitude}');
    NetworkHelper networkHelper = new NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    // print('Waiting for weatherData');

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
