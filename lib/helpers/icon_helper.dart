class IconHelper {
  String getIconLocation(String weather) {
    String asset_location = "assets/weather/";
    String weather_icon;
    switch (weather) {
      case "01d":
        weather_icon = "${asset_location}sun.png";
        break;
      case "01n":
        weather_icon = "${asset_location}moon.png";
        break;
      case "02d":
      case "03d":
        weather_icon = "${asset_location}light_cloud_day.png";
        break;
      case "02n":
      case "03n":
        weather_icon = "${asset_location}light_cloud_night.png";
        break;
      case "04d":
      case "04n":
        weather_icon = "${asset_location}cloudy.png";
        break;
      case "09d":
      case "09n":
        weather_icon = "${asset_location}shower_rain.png";
        break;
      case "10d":
        weather_icon = "${asset_location}rain_day.png";
        break;
      case "10n":
        weather_icon = "${asset_location}rain_night.png";
        break;
      case "11d":
      case "11n":
        weather_icon = "${asset_location}storm.png";
        break;
      case "13d":
      case "13n":
        weather_icon = "${asset_location}snow.png";
        break;
      case "50d":
      case "50n":
        weather_icon = "${asset_location}mist.png";
        break;
      default:
        weather_icon = "${asset_location}sun.png";
    }
    return weather_icon;
  }
}
