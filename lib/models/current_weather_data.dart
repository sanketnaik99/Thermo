class CurrentWeatherData {
  final String datetime;
  final String sunrise;
  final String sunset;
  final double current;
  final double feelsLike;
  final double minTemp;
  final double maxTemp;
  final int humidity;
  final int visibility;
  final String title;
  final String description;
  final String icon;

  CurrentWeatherData({
    this.datetime,
    this.sunrise,
    this.sunset,
    this.current,
    this.feelsLike,
    this.minTemp,
    this.maxTemp,
    this.humidity,
    this.visibility,
    this.title,
    this.description,
    this.icon,
  });
}
