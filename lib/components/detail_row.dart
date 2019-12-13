import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class DetailRow extends StatelessWidget {
  DetailRow({
    @required this.title,
    @required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '$title',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 21.0,
                color: kPrimaryTextColor,
              ),
            ),
            Text(
              '${value}',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 21.0,
                color: kPrimaryTextColor,
              ),
            )
          ],
        ),
        Divider(
          color: kAlternateLightColor,
          thickness: 3.0,
        )
      ],
    );
  }
}
