import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/weather_data.dart';

class WeatherAppBar extends StatelessWidget {
  const WeatherAppBar({@required this.data, @required this.refresh, @required this.openDrawer});

  final WeatherData data;
  final Function refresh;
  final Function openDrawer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.menu,
            size: 30.0,
          ),
          tooltip: "Open Menu",
          color: kPrimaryColor,
          onPressed: openDrawer,
        ),
//            Container(
//              height: 46.0,
//              width: 46.0,
//            ),
        Expanded(
          child: Center(
            child: AutoSizeText(
              '${data.currentWeather.datetime}',
              style: kCommonTextStyle.copyWith(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.refresh,
            size: 30.0,
          ),
          tooltip: "Refresh",
          color: kPrimaryColor,
          onPressed: refresh,
        ),
      ],
    );
  }
}
