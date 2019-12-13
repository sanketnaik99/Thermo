import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;

  _checkPermission() async {
    GeolocationStatus status = await Geolocator().checkGeolocationPermissionStatus();
    print(status);
    if (status == GeolocationStatus.denied) {
      Navigator.pushReplacementNamed(context, 'locationRequest');
    } else if (status == GeolocationStatus.granted) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      Navigator.pushReplacementNamed(context, 'locationRequest');
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _visible = true;
    });
    Timer(Duration(seconds: 2), _checkPermission);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(seconds: 2),
              child: Container(
                child: Image.asset(
                  'assets/sun.png',
                  width: 256.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Thermo',
              style: TextStyle(
                fontSize: 50.0,
                color: kPrimaryTextColor,
                fontWeight: FontWeight.w900,
                fontFamily: 'Montserrat',
              ),
            )
          ],
        ),
      ),
    );
  }
}
