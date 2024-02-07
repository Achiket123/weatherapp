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
    icon: 'https://cdn.weatherapi.com/weather/64x64/day/113.png');

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
    icon: 'https://cdn.weatherapi.com/weather/64x64/day/113.png');

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
    icon: 'https://cdn.weatherapi.com/weather/64x64/day/113.png');

MiniWeatherModel miniWeatherModel = MiniWeatherModel(
    time: '00:00',
    icon: 'https://cdn.weatherapi.com/weather/64x64/day/113.png',
    temp: '20');

List<MiniWeatherModel> listofMiniWeatherModel = [
  miniWeatherModel,
];

var openBox = '10';

List<Weather> listofWeather = [
  todaysWeather,
  tomorrowsWeather,
  dayafterTomorrowsWeather
];
