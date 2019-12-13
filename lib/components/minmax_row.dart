import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/weather_data.dart';

class MinRow extends StatelessWidget {
  const MinRow({
    @required this.icon,
    @required this.value,
  });

  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "$value°C",
          style: kCommonTextStyle.copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Icon(
          icon,
          size: 20.0,
          color: kPrimaryTextColor,
        ),
      ],
    );
  }
}

class MaxRow extends StatelessWidget {
  const MaxRow({
    @required this.icon,
    @required this.value,
  });

  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          size: 20.0,
          color: kPrimaryTextColor,
        ),
        Text(
          "$value°C",
          style: kCommonTextStyle.copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
