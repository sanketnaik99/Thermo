import 'package:weather_app/helpers/forecast_list_helper.dart';
import 'package:weather_app/models/current_weather_data.dart';

class ForecastData {
  List<CurrentWeatherData> forecast;

  ForecastData({this.forecast});

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    List forecasts = json['list'].sublist(1, 7);

    print('${forecasts.length} = LENGTH');
    return ForecastData(forecast: ForecastListHelper().getForecast(forecasts));
  }
}
