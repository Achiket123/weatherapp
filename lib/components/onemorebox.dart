import 'package:flutter/material.dart';
import 'package:weatherapp/models/weathermodel.dart';
// ignore: unused_import
import 'package:weatherapp/someconst.dart';

// ignore: must_be_immutable
class OneMoreBox extends StatelessWidget {
  List<Weather> listofweather;
  OneMoreBox({super.key, required this.listofweather});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const Alignment(0, 1.1),
          child: Container(
            height: 40,
            margin: const EdgeInsets.only(left: 50, right: 50),
            decoration: BoxDecoration(
                color: const Color.fromARGB(58, 255, 255, 255),
                borderRadius: BorderRadius.circular(50)),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
            width: 400,
            height: 330,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20),
                  child: Row(
                    children: [
                      Text(
                        'Future Weather',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: listofweather.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Image.network(
                                    listofweather[index].icon,
                                  ),
                                ),
                                Text(
                                  listofweather[index].temp,
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      listofweather[index].day,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      listofweather[index].date,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 162, 162, 162),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                        Container(
                          width: 300,
                          height: 2,
                          color: const Color.fromARGB(255, 228, 228, 228),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
