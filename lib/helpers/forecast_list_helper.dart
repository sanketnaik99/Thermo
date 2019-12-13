import 'package:intl/intl.dart';
import 'package:weather_app/helpers/icon_helper.dart';
import 'package:weather_app/models/current_weather_data.dart';

class ForecastListHelper {
  List<CurrentWeatherData> getForecast(List forecasts) {
    //print(forecasts);
    List<CurrentWeatherData> forecastList = [];
    forecasts.forEach((item) {
      forecastList.add(CurrentWeatherData(
        icon: IconHelper().getIconLocation(item['weather'][0]['main']),
        datetime: DateFormat('d/M')
            .format(DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000)),
        current: item['temp']['day'],
        minTemp: item['temp']['min'],
        maxTemp: item['temp']['max'],
      ));
    });
    return forecastList;
  }
}
