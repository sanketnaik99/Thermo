import 'dart:convert';
import 'package:advertising_id/advertising_id.dart';
import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app/components/detail_row.dart';
import 'package:weather_app/components/details_table.dart';
import 'package:weather_app/components/forecast_info.dart';
import 'package:weather_app/components/weather_info.dart';
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

  _fetchWeatherData() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    print(position);
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });

    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=e9a62ba05befddcb4097d2a5dcb9b42e');
    setState(() {
      data = WeatherData.fromJson(json.decode(response.body));
    });
    print('CITY: ${data.city} Status: ${data.currentWeather.icon}');

    http.Response forecast = await http.get(
        'https://api.openweathermap.org/data/2.5/forecast/daily?lat=$latitude&lon=$longitude&appid=e9a62ba05befddcb4097d2a5dcb9b42e');
    setState(() {
      forecastData = ForecastData.fromJson(json.decode(forecast.body));
    });

    print(forecastData.forecast[0].datetime);
  }

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
    FacebookAudienceNetwork.init(testingId: '');
  }

  @override
  void dispose() {
    super.dispose();
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
                      WeatherInfo(data: data),
                      DetailsTable(data: data),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        child: Container(
//                          child: FacebookBannerAd(
//                            placementId: '1213934525660668_1213935972327190',
//                            bannerSize: BannerSize.STANDARD,
//                            listener: (result, value) {
//                              switch (result) {
//                                case BannerAdResult.ERROR:
//                                  print("Error: $value");
//                                  break;
//                                case BannerAdResult.LOADED:
//                                  print("Loaded: $value");
//                                  break;
//                                case BannerAdResult.CLICKED:
//                                  print("Clicked: $value");
//                                  break;
//                                case BannerAdResult.LOGGING_IMPRESSION:
//                                  print("Logging Impression: $value");
//                                  break;
//                              }
//                            },
//                          ),
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child: Text(
                          'Forecast',
                          style: kCommonTextStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 160.0,
                        child: forecastData != null
                            ? ForecastInfo(
                                forecast: forecastData.forecast,
                              )
                            : SpinKitDoubleBounce(
                                color: kPrimaryColor,
                                size: 20.0,
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Icons made by ',
                                style: kCommonTextStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.0,
                                ),
                              ),
                              TextSpan(
                                text: 'Freepik ',
                                style: kCommonTextStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11.0,
                                ),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                        'https://www.flaticon.com/authors/freepik',
                                        forceSafariVC: false);
                                  },
                              ),
                              TextSpan(
                                text: 'from ',
                                style: kCommonTextStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.0,
                                ),
                              ),
                              TextSpan(
                                text: 'www.flaticon.com',
                                style: kCommonTextStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11.0,
                                ),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                        'https://www.flaticon.com/authors/freepik',
                                        forceSafariVC: false);
                                  },
                              )
                            ],
                          ),
                        ),
                      ),
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
