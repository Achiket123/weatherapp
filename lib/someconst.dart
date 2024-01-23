import 'package:weatherapp/models/weathermodel.dart';

Weather todaysWeather = Weather(
    date: 'date',
    day: 'day',
    temp: 'temp',
    weather: 'weather',
    city: 'city',
    humidity: 'humidity',
    pressure: 'pressure',
    visibility: 'visibility',
    windSpeed: 'windSpeed',
    icon: '');

Weather tomorrowsWeather = Weather(
    date: 'date',
    day: 'day',
    temp: 'temp',
    weather: 'weather',
    city: 'city',
    humidity: 'humidity',
    pressure: 'pressure',
    visibility: 'visibility',
    windSpeed: 'windSpeed',
    icon: '');

Weather dayafterTomorrowsWeather = Weather(
    date: 'date',
    day: 'day',
    temp: 'temp',
    weather: 'weather',
    city: 'city',
    humidity: 'humidity',
    pressure: 'pressure',
    visibility: 'visibility',
    windSpeed: 'windSpeed',
    icon: '');

MiniWeatherModel miniWeatherModel = MiniWeatherModel(
    time: '00:00',
    icon: '//cdn.weatherapi.com/weather/64x64/night/113.png',
    temp: '20');

List<MiniWeatherModel> listofMiniWeatherModel = [
  miniWeatherModel,
];

var openBox = '4';

List<Weather> listofWeather = [
  todaysWeather,
  tomorrowsWeather,
  dayafterTomorrowsWeather
];
