import 'package:flutter/material.dart';
import 'package:weatherapp/models/weathermodel.dart';

// ignore: must_be_immutable
class MiniBoxes extends StatelessWidget {
  MiniWeatherModel weather;
  bool isfirst;
  MiniBoxes({super.key, required this.weather, required this.isfirst});

  @override
  Widget build(BuildContext context) {
    print(weather.icon);
    return Container(
      padding: const EdgeInsets.only(top: 30),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 40),
                color: Color.fromARGB(255, 124, 122, 238),
                blurRadius: 200,
                spreadRadius: -100)
          ]),
      child: Card(
        surfaceTintColor: Colors.transparent,
        color: const Color.fromARGB(0, 109, 42, 42),
        shadowColor: const Color.fromARGB(255, 96, 185, 215),
        elevation: 0,
        child: Container(
            width: 90,
            decoration: BoxDecoration(
                color: isfirst ? Colors.transparent : Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: isfirst
                    ? const DecorationImage(
                        image: AssetImage('assets/bg.png'), fit: BoxFit.cover)
                    : null),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(children: [
                    Text(
                      weather.time,
                      style: TextStyle(
                          fontSize: 12,
                          color: isfirst ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: Image.network(
                        '${weather.icon}',
                        fit: BoxFit.fitWidth
                        // 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                        ,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${weather.temp} °C',
                      style: TextStyle(
                          fontSize: 17,
                          color: isfirst ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
              ],
            )),
      ),
    );
  }
}
