import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app/components/detail_row.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/forecast_data.dart';
import 'package:weather_app/models/weather_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double latitude, longitude;
  WeatherData data;
  ForecastData forecastData;
  String date;
  String sunrise;
  String sunset;

  _fetchWeatherData() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    print(position);
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });

    http.Response response =
        await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=e9a62ba05befddcb4097d2a5dcb9b42e');
    setState(() {
      data = WeatherData.fromJson(json.decode(response.body));

      DateTime time = new DateTime.fromMillisecondsSinceEpoch(data.currentWeather.datetime * 1000);
      date = DateFormat('EEEE, d MMMM').format(time);

      sunrise = DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(data.currentWeather.sunrise * 1000));
      sunset = DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(data.currentWeather.sunset * 1000));
    });
    print('CITY: ${data.city} Status: ${data.currentWeather.icon}');

    http.Response forecast =
        await http.get('https://api.openweathermap.org/data/2.5/forecast/daily?lat=$latitude&lon=$longitude&appid=e9a62ba05befddcb4097d2a5dcb9b42e');
    forecastData = ForecastData.fromJson(json.decode(forecast.body));
    print(forecastData.forecast.length);
  }

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: data != null
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        '${date.toString()}',
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
                          '${((data.currentWeather.current) - 273).floor()}°C',
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
                              value: sunrise,
                            ),
                            DetailRow(
                              title: 'Sunset',
                              value: sunset,
                            ),
                            DetailRow(
                              title: "Humidity",
                              value: "${data.currentWeather.humidity}%",
                            ),
                            DetailRow(
                              title: 'Visibility',
                              value: '${(data.currentWeather.visibility / 1000).floorToDouble()} Km',
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SpinKitDoubleBounce(
                    color: kPrimaryColor,
                    size: 30.0,
                  ),
                ],
              ),
      ),
    );
  }
}
