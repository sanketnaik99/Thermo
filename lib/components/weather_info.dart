import 'package:flutter/material.dart';
import 'package:weather_app/components/minmax_row.dart';
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
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                size: 35.0,
                color: kAlternateLightColor,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${data.city}',
                  style: kCommonTextStyle.copyWith(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          '${data.currentWeather.datetime}',
          style: kCommonTextStyle.copyWith(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 30.0),
          child: Container(
            width: 350.0,
            height: 6.0,
            color: kPrimaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
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
