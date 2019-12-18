import 'package:intl/intl.dart';
import 'package:weather_app/helpers/icon_helper.dart';
import 'package:weather_app/models/current_weather_data.dart';

class WeatherData {
  final String city;
  final CurrentWeatherData currentWeather;
  final String updated;

  WeatherData({this.city, this.currentWeather, this.updated});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      city: json['name'],
      currentWeather: CurrentWeatherData(
        datetime: DateFormat('EEEE, d MMMM').format(DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000)),
        sunrise: DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(json['sys']['sunrise'] * 1000)),
        sunset: DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset'] * 1000)),
        current: json['main']['temp'],
        feelsLike: json['main']['feels_like'],
        minTemp: json['main']['temp_min'],
        maxTemp: json['main']['temp_max'],
        humidity: json['main']['humidity'],
        visibility: json['visibility'] ?? 0.0,
        title: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        icon: IconHelper().getIconLocation(json['weather'][0]['icon']),
      ),
      updated: DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000)),
    );
  }
}
