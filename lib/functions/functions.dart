import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

String time(String time) {
  var str = '';
  for (var i = 0; i < time.length; i++) {
    // 14-21
    if (i >= 0 && i <= 9) {
      str = str + time[i];
    }
  }
  return str;
}

getData(String key, String location) async {
  String uri =
      'http://api.weatherapi.com/v1/forecast.json?key=$key&q=$location&days=7&aqi=no';
  Map<String, String> headers = {'Content-Type': 'application/json'};
  var resp = await http.get(Uri.parse(uri), headers: headers);
  print(resp.statusCode);
  print(resp.body);
  // print('hello');
  // print(JsonDecoder().convert(resp.body));
  return JsonDecoder().convert(resp.body);
}

String timefun(String time) {
  var str = '';
  for (var i = 0; i < time.length; i++) {
    if (i >= 11 && i <= 16) str = str + time[i];
  }
  return str;
}

String timefuns(String time) {
  var str = '';
  for (var i = 0; i < time.length; i++) {
    if (i >= 11 && i <= 15) str = str + time[i];
  }
  return str;
}

String findDayOfWeek(String date) {
  // Define a DateFormat with the desired format
  DateFormat formatter =
      DateFormat('EEEE'); // 'EEEE' represents the full weekday name
  var dates = DateTime.parse(date);
  // Format the date and retrieve the day of the week
  String dayOfWeek = formatter.format(dates);

  return dayOfWeek;
}

Future<String> getCurrentLocation() async {
  try {
    if (Geolocator.checkPermission() == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );


    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    // Extract the city from the placemark
    String city = placemarks.first.locality.toString();
    print(city);
    return city;
  } catch (e) {
    return 'Patna';
  }
}
