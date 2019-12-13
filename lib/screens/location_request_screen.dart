import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/constants.dart';

class LocationRequestScreen extends StatelessWidget {
  Future<bool> _getPermission() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    GeolocationStatus status = await Geolocator().checkGeolocationPermissionStatus();
    if (status == GeolocationStatus.granted) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 400.0,
              height: 400.0,
              child: FlareActor(
                'assets/animations/maps.flr',
                alignment: Alignment.center,
                fit: BoxFit.cover,
                animation: "anim",
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Allow your location',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: kPrimaryTextColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'We will need your permission to get you accurate weather data',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    textColor: kAlternateLightColor,
                    padding: const EdgeInsets.all(15.0),
                    color: kPrimaryColor,
                    child: Text('Grant Permission', style: TextStyle(fontSize: 20)),
                    onPressed: () async {
                      bool status = await _getPermission();
                      if (status = true) {
                        Navigator.pushReplacementNamed(context, 'home');
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
