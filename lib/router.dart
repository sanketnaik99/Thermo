import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/location_request_screen.dart';
import 'package:weather_app/screens/splash_screen.dart';

class FluroRouter {
  static Router router = Router();

  static Handler _homeScreenHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => HomeScreen());
  static Handler _splashScreenHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => SplashScreen());
  static Handler _locationRequestScreenHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => LocationRequestScreen());

  static void setupRouter() {
    router.define('home', handler: _homeScreenHandler);
    router.define('splash', handler: _splashScreenHandler);
    router.define('locationRequest', handler: _locationRequestScreenHandler);
  }
}
