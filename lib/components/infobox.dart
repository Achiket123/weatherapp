// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherapp/models/weathermodel.dart';

class InfoBox extends StatelessWidget {
  Weather weather;
  InfoBox({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 255, 255, 255)),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 25),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                WeatherIcons.humidity,
                size: 30,
                color: Color.fromARGB(255, 78, 81, 243),
              ),
              Text(
                weather.humidity,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Humidity',
                  style: TextStyle(color: Colors.grey, fontSize: 10))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                WeatherIcons.wind_beaufort_0,
                size: 30,
                color: Color.fromARGB(255, 78, 81, 243),
              ),
              Text(
                weather.windSpeed,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('WindSpeed',
                  style: TextStyle(color: Colors.grey, fontSize: 10))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                WeatherIcons.barometer,
                size: 30,
                color: Color.fromARGB(255, 78, 81, 243),
              ),
              Text(
                weather.pressure,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Air Pressure',
                  style: TextStyle(color: Colors.grey, fontSize: 10))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                WeatherIcons.alien,
                size: 30,
                color: Color.fromARGB(255, 78, 81, 243),
              ),
              Text(
                weather.visibility,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'visibility',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
