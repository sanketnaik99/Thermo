import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/weather_data.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    @required this.data,
  });

  final WeatherData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
          child: AutoSizeText(
            '${data.city}',
            maxLines: 1,
            style: kCommonTextStyle.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 50.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
          child: Container(
            width: 350.0,
            height: 6.0,
            color: kPrimaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Updated at ${data.updated} ',
            style: kCommonTextStyle.copyWith(
              color: kAlternateLightColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          child: Text(
            '${data.currentWeather.title}',
            style: kCommonTextStyle.copyWith(
              fontSize: 40.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Image.asset(
          data.currentWeather.icon,
          width: 250.0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
          child: Text(
            '${((data.currentWeather.current) - 273.0).floor()}°C',
            style: kCommonTextStyle.copyWith(
              fontSize: 70.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
          child: Container(
            width: 200.0,
            height: 6.0,
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
