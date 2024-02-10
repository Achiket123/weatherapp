
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weatherapp/functions/functions.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/someconst.dart';
import 'package:http/http.dart' as http;

backend()async{ 
  
    final _box =  await Hive.openBox(openBox);
  try {
    
  
  if (_box.isEmpty) {
    
    var response = await getData(APIKEY,await getCurrentLocation());
    // print(response);
    // var response = await http.get(Uri.parse('http://localhost:5000'));
    print(response.body);
    await _box.putAll(response);
  } else {

    // print(_box.get('date').runtimeType);
    // print(false);
    var response = await getData(APIKEY,await getCurrentLocation());
//  var response = await http.get(Uri.parse('http://localhost:5000'));
    // print(response.body);
    await _box.putAll(response);
  }
  
  var response = await _box.toMap() ;
  print(response);
  todaysWeather = Weather(
      date: time(response['location']['localtime'].toString()),
      day: findDayOfWeek(response['forecast']['forecastday'][0]['date']),
      temp: response['current']['feelslike_c'].toString(),
      weather: response['current']['condition']['text'].toString(),
      city: response['location']['name'].toString(),
      humidity: response['current']['humidity'].toString(),
      pressure: response['current']['pressure_mb'].toString(),
      visibility: response['current']['vis_km'].toString(),
      windSpeed: response['current']['wind_kph'].toString(),
      icon: 'https:${response['current']['condition']['icon']}');

  tomorrowsWeather = Weather(
      date: response['forecast']['forecastday'][1]['date'],
      day: findDayOfWeek(response['forecast']['forecastday'][1]['date']),
      temp:
          response['forecast']['forecastday'][1]['day']['avgtemp_c'].toString(),
      weather: response['forecast']['forecastday'][1]['day']['condition']
              ['text']
          .toString(),
      city: response['location']['name'].toString(),
      humidity: response['forecast']['forecastday'][1]['day']['avghumidity']
          .toString(),
      pressure: response['forecast']['forecastday'][1]['hour'][0]['pressure_mb']
          .toString(),
      visibility:
          response['forecast']['forecastday'][1]['day']['avgvis_km'].toString(),
      windSpeed: response['forecast']['forecastday'][1]['day']['maxind_kph']
          .toString(),
      icon:
          'https:${response['forecast']['forecastday'][1]['day']['condition']['icon']}');

  dayafterTomorrowsWeather = Weather(
      date: response['forecast']['forecastday'][2]['date'],
      day: findDayOfWeek(response['forecast']['forecastday'][2]['date']),
      temp:
          response['forecast']['forecastday'][2]['day']['avgtemp_c'].toString(),
      weather: response['forecast']['forecastday'][2]['day']['condition']
              ['text']
          .toString(),
      city: response['location']['name'].toString(),
      humidity: response['forecast']['forecastday'][2]['day']['avghumidity']
          .toString(),
      pressure: response['forecast']['forecastday'][2]['hour'][0]['pressure_mb']
          .toString(),
      visibility:
          response['forecast']['forecastday'][2]['day']['avgvis_km'].toString(),
      windSpeed: response['forecast']['forecastday'][2]['day']['maxind_kph']
          .toString(),
      icon:
          'https:${response['forecast']['forecastday'][2]['day']['condition']['icon']}');
          listofWeather=[todaysWeather,tomorrowsWeather,dayafterTomorrowsWeather];
          listofMiniWeatherModel=[];

  for (var i = 0;
      i < response['forecast']['forecastday'][0]['hour'].length;
      i++) {
    MiniWeatherModel miniWeatherModel1 = MiniWeatherModel(
        time: timefun(response['forecast']['forecastday'][0]['hour'][i]['time']
            .toString()),
        icon:
            'https:${response['forecast']['forecastday'][0]['hour'][i]['condition']['icon']}'
                .toString(),
        temp: response['forecast']['forecastday'][0]['hour'][i]['feelslike_c']
            .toString());

    listofMiniWeatherModel.add(miniWeatherModel1);
  }} catch (e) {
    
    
    // print(e);
    }
}


preload()async{
  
  try{
  final _box =await Hive.openBox(openBox);
  if(_box.isNotEmpty){
    var response = await _box.toMap() ;
  todaysWeather = Weather(
      date: time(response['location']['localtime'].toString()),
      day: findDayOfWeek(response['forecast']['forecastday'][0]['date']),
      temp: response['current']['feelslike_c'].toString(),
      weather: response['current']['condition']['text'].toString(),
      city: response['location']['name'].toString(),
      humidity: response['current']['humidity'].toString(),
      pressure: response['current']['pressure_mb'].toString(),
      visibility: response['current']['vis_km'].toString(),
      windSpeed: response['current']['wind_kph'].toString(),
      icon: 'https:${response['current']['condition']['icon']}');

  tomorrowsWeather = Weather(
      date: response['forecast']['forecastday'][1]['date'],
      day: findDayOfWeek(response['forecast']['forecastday'][1]['date']),
      temp:
          response['forecast']['forecastday'][1]['day']['avgtemp_c'].toString(),
      weather: response['forecast']['forecastday'][1]['day']['condition']
              ['text']
          .toString(),
      city: response['location']['name'].toString(),
      humidity: response['forecast']['forecastday'][1]['day']['avghumidity']
          .toString(),
      pressure: response['forecast']['forecastday'][1]['hour'][0]['pressure_mb']
          .toString(),
      visibility:
          response['forecast']['forecastday'][1]['day']['avgvis_km'].toString(),
      windSpeed: response['forecast']['forecastday'][1]['day']['maxind_kph']
          .toString(),
      icon:
          'https:${response['forecast']['forecastday'][1]['day']['condition']['icon']}');

  dayafterTomorrowsWeather = Weather(
      date: response['forecast']['forecastday'][2]['date'],
      day: findDayOfWeek(response['forecast']['forecastday'][2]['date']),
      temp:
          response['forecast']['forecastday'][2]['day']['avgtemp_c'].toString(),
      weather: response['forecast']['forecastday'][2]['day']['condition']
              ['text']
          .toString(),
      city: response['location']['name'].toString(),
      humidity: response['forecast']['forecastday'][2]['day']['avghumidity']
          .toString(),
      pressure: response['forecast']['forecastday'][2]['hour'][0]['pressure_mb']
          .toString(),
      visibility:
          response['forecast']['forecastday'][2]['day']['avgvis_km'].toString(),
      windSpeed: response['forecast']['forecastday'][2]['day']['maxind_kph']
          .toString(),
      icon:
          'https:${response['forecast']['forecastday'][2]['day']['condition']['icon']}');
  
   listofMiniWeatherModel=[];

  for (var i = 0;
      i < response['forecast']['forecastday'][0]['hour'].length;
      i++) {
    MiniWeatherModel miniWeatherModel1 = MiniWeatherModel(
        time: timefun(response['forecast']['forecastday'][0]['hour'][i]['time']
            .toString()),
        icon:
            'https:${response['forecast']['forecastday'][0]['hour'][i]['condition']['icon']}'
                .toString(),
        temp: response['forecast']['forecastday'][0]['hour'][i]['feelslike_c']
            .toString());

    listofMiniWeatherModel.add(miniWeatherModel1);
  }}}catch(e){
    throw e;
  }
}