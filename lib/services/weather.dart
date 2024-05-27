import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';


const apiKey = '38e8a96ec538c47a012e33c28713f884';

class WeatherModel {

  Future<Map<String, dynamic>?> getCityWeather(String cityName) async {
    final url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'q': cityName,
        'units': 'metric', // Specify the desired units (e.g., metric)
        'appid': apiKey,
      },
    );

    NetworkHelper networkHelper = NetworkHelper(url.toString());

    var weatherData = await networkHelper.getData();
    return weatherData;
  }


  Future<Map<String, dynamic>?> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    final url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
        'units': 'metric', // Specify the desired units (e.g., metric)
        'appid': apiKey,
      },
    );

    NetworkHelper networkHelper = NetworkHelper(url.toString());

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
