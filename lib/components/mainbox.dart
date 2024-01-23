import 'package:flutter/material.dart';
import 'package:weatherapp/models/weathermodel.dart';

class MainWeatherBox extends StatelessWidget {
  final Weather weather;
  const MainWeatherBox({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        surfaceTintColor: Colors.transparent,
        color: Colors.transparent,
        shadowColor: const Color.fromARGB(255, 145, 198, 215),
        elevation: 0,
        child: Container(
            width: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: const DecorationImage(
                    image: AssetImage('assets/bg.png'), fit: BoxFit.cover)),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(children: [
                    SizedBox(
                        height: 120,
                        child: Image.network(weather.icon, fit: BoxFit.cover)),
                    Text(
                      '${weather.temp} °C',
                      style: const TextStyle(fontSize: 60, color: Colors.white),
                    ),
                    Text(
                      weather.weather,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ]),
                ),
                Align(
                  alignment: const Alignment(0, -1.1),
                  child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: Text(
                      '${weather.day}, ${weather.date}',
                      style: const TextStyle(fontSize: 10),
                    )),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
