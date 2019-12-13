import 'package:weather_app/helpers/icon_helper.dart';
import 'package:weather_app/models/current_weather_data.dart';

class ForecastListHelper {
  List<CurrentWeatherData> getForecast(List forecasts) {
    //print(forecasts);
    List<CurrentWeatherData> forecastList = [];
    forecasts.forEach((item) {
      forecastList.add(CurrentWeatherData(
        icon: IconHelper().getIconLocation(item['weather'][0]['main']),
        current: ((item['temp']['min'] + item['temp']['max']) / 2),
        minTemp: item['temp']['min'],
        maxTemp: item['temp']['max'],
      ));
    });
    return forecastList;
  }
}
