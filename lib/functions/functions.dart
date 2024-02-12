import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/someconst.dart';

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

Future<dynamic> getData(String key) async {
  await getCurrentLocation();
  print(locationData);

  for(var i in locationData){
    var city =  i['Name'];
    print(city);
  String uri =
      'http://api.weatherapi.com/v1/forecast.json?key=$key&q=$city&days=7&aqi=no&alerts=no';
  Map<String, String> headers = {'Content-Type': 'application/json'};
  var resp = await http.get(Uri.parse(uri), headers: headers);
  print(resp.body);
  print('object');
  var data = JsonDecoder().convert(resp.body);
  if (!data.containsKey('error')) {
    return data;
  }
  }
  
  // var resp = await http.get(Uri.parse(uri), headers: headers);

  //rint((resp.body));
  

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

 getCurrentLocation({index = 0}) async {
  if (locationData.isEmpty) {
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
      var pin = '231217';
      for (var i in placemarks) {
        if (i.postalCode!.isNotEmpty) {
          print(i.postalCode);
          pin = i.postalCode.toString();
        }
      }
      var data = await http
          .get(Uri.parse('https://api.postalpincode.in/pincode/$pin'));

      if (data.statusCode == 200) {
        var data_ = jsonDecode(data.body);
        print(data_);
        locationData = data_[0]['PostOffice'];
      }

     
    } catch (e) {
      print(e);
     
    }
  } 
}

permission() async {
  var status = await Permission.location.request();
  if (status == PermissionStatus.granted) {
    print("Location permission granted!");
  } else if (status == PermissionStatus.denied) {
    permission();
  } else {
    permission();
  }
}
