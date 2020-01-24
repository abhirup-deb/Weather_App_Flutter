import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apikey = 'f814ce45204a4cedecbcfceecb88cf88';
class WeatherModel {

  double lon;
  double lat;

  Future<dynamic> getTypedLocation(String cityName) async{
    getNetwork getnetwork =  getNetwork('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric');
    var weatherdata = await getnetwork.getData();
    print(weatherdata);
    return weatherdata;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    lat=location.latitude;
    lon=location.longitude;

    getNetwork getnetwork = getNetwork('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric');
    var weatherdata = await getnetwork.getData();
    print(weatherdata);
    return weatherdata;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌁';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🤷‍♀️';
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
