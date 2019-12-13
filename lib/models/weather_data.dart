import 'package:weather_app/helpers/icon_helper.dart';
import 'package:weather_app/models/current_weather_data.dart';

class WeatherData {
  final String city;
  final CurrentWeatherData currentWeather;

  WeatherData({this.city, this.currentWeather});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      city: json['name'],
      currentWeather: CurrentWeatherData(
        datetime: json['dt'],
        sunrise: json['sys']['sunrise'],
        sunset: json['sys']['sunset'],
        current: json['main']['temp'],
        feelsLike: json['main']['feels_like'],
        minTemp: json['main']['temp_min'],
        maxTemp: json['main']['temp_max'],
        humidity: json['main']['humidity'],
        visibility: json['visibility'],
        title: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        icon: IconHelper().getIconLocation(json['weather'][0]['icon']),
      ),
    );
  }
}