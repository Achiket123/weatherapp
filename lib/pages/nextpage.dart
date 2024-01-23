import 'package:flutter/material.dart';
import 'package:weatherapp/components/onemorebox.dart';
import 'package:weatherapp/pages/homepage.dart';
import 'package:weatherapp/someconst.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg.png'),
                    fit: BoxFit.cover,
                    scale: 2)),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 40,
                        child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (builder) => HomePage()));
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                      ),
                      Container(
                        alignment: const Alignment(0, 0),
                        child: Center(
                            child: Column(
                          children: [
                            const Text(
                              'Today\'s Weather',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${todaysWeather.day},${todaysWeather.date}',
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                      ),
                      Container(
                        width: 40,
                      )
                    ]),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 40, 30, 30),
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(50, 192, 192, 192),
                  borderRadius: BorderRadius.circular(50),
                  border: const Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    top: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    left: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    right: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.network(
                              todaysWeather.icon,
                              fit: BoxFit.cover,
                            )),
                        Column(
                          children: [
                            Center(
                              child: Text(
                                '${todaysWeather.temp}°',
                                style: const TextStyle(
                                    fontSize: 80, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                todaysWeather.weather,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
              OneMoreBox(
                listofweather: listofWeather,
              ),
            ])));
  }
}
