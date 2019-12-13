import 'package:flutter/material.dart';
import 'package:weather_app/components/detail_row.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/weather_data.dart';

class DetailsTable extends StatelessWidget {
  const DetailsTable({
    @required this.data,
  });

  final WeatherData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Details',
          style: kCommonTextStyle.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              DetailRow(
                title: 'Feels Like',
                value: '${(data.currentWeather.feelsLike - 273).floor()}°C',
              ),
              DetailRow(
                title: 'Sunrise',
                value: data.currentWeather.sunrise,
              ),
              DetailRow(
                title: 'Sunset',
                value: data.currentWeather.sunset,
              ),
              DetailRow(
                title: "Humidity",
                value: "${data.currentWeather.humidity}%",
              ),
              DetailRow(
                title: 'Visibility',
                value:
                    '${(data.currentWeather.visibility / 1000).floorToDouble()} Km',
              )
            ],
          ),
        )
      ],
    );
  }
}
