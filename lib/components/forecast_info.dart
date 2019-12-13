import 'package:flutter/material.dart';
import 'package:weather_app/components/minmax_row.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/current_weather_data.dart';

class ForecastInfo extends StatelessWidget {
  ForecastInfo({@required this.forecast});
  final List<CurrentWeatherData> forecast;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: forecast.length,
      itemBuilder: (context, index) {
        final item = forecast[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 160.0,
            height: 160.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: kAlternateLightColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${(item.current - 273.0).toStringAsFixed(1)}°C',
                        style: kCommonTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${item.datetime}',
                        style: kCommonTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        '${item.icon}',
                        width: 60.0,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MinRow(
                        icon: Icons.arrow_drop_down,
                        value: '${(item.minTemp - 273.0).toStringAsFixed(1)}',
                      ),
                      MaxRow(
                        icon: Icons.arrow_drop_up,
                        value: '${(item.maxTemp - 273.0).toStringAsFixed(1)}',
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
