class Weather {
  String day;
  String date;
  String weather;
  String temp;
  String city;
  String humidity;
  String pressure;
  String windSpeed;
  String visibility;
  String icon;

  Weather(
      {required this.date,
      required this.day,
      required this.temp,
      required this.weather,
      required this.city,
      required this.humidity,
      required this.pressure,
      required this.visibility,
      required this.windSpeed
      ,required this.icon});
}

class MiniWeatherModel {
  String time;
  String icon;
  String temp;
  MiniWeatherModel(
      {required this.time, required this.icon, required this.temp});
}
