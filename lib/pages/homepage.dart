import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:weatherapp/bloc/databloc.dart';
import 'package:weatherapp/components/infobox.dart';
import 'package:weatherapp/components/mainbox.dart';
import 'package:weatherapp/components/miniboxes.dart';
import 'package:weatherapp/functions/backend.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/pages/nextpage.dart';
import 'package:weatherapp/someconst.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _box = Hive.box(openBox);

  putDate() async {
    await _box.put('date', DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    putDate();

context.read<WeatherBloc>().add(RequestingData());
    return Scaffold(
      body: LiquidPullToRefresh(
        animSpeedFactor: 3,
        showChildOpacityTransition: true,
        color: const Color.fromARGB(46, 7, 61, 255),
        backgroundColor: const Color.fromARGB(30, 7, 94, 255),
        onRefresh: () async {
          context.read<WeatherBloc>().add(RequestingData());
        },
        child: ListView(
          children: [
            Container(
              height: 450,
              color: const Color.fromRGBO(233, 231, 245, 1),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Column(
                      children: [
                        Center(child: BlocBuilder<WeatherBloc, List<Weather>>(
                          builder: (context, state) {
                            return Text(
                              todaysWeather.city,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            );
                          },
                        )),
                        Center(
                            child: DigitalClock(
                                is24HourTimeFormat: false,
                                showSecondsDigit: false,
                                hourMinuteDigitTextStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)))
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 320,
                      child: ScrollSnapList(
                          shrinkWrap: true,
                          onItemFocus: (index) {},
                          itemSize: 268,
                          itemCount: listofWeather.length,
                          itemBuilder: (p0, p1) {
                            return BlocBuilder<WeatherBloc, List<Weather>>(
                              builder: (context, state) {
                                return MainWeatherBox(
                                    weather: listofWeather[p1]);
                              },
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.33),
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 50),
                      blurStyle: BlurStyle.normal,
                      color: Color.fromARGB(237, 134, 116, 239),
                      spreadRadius: -30,
                      blurRadius: 300),
                ]),
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: BlocBuilder<WeatherBloc, List<Weather>>(
                  builder: (context, state) {
                    return InfoBox(weather: todaysWeather);
                  },
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.579),
              child: Container(
                padding: const EdgeInsets.only(left: 28, right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NextPage()));
                          },
                          child: const Row(
                            children: [
                              Text(
                                'Next 3 Days',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ))
                    ]),
              ),
            ),
            Align(
              alignment: const Alignment(0, 1),
              child: SizedBox(
                  height: 160,
                  child: BlocBuilder<WeatherBloc, List<Weather>>(
                    builder: (context, state) {
                      return ListView.builder(
                        itemCount: listofMiniWeatherModel.length,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 30),
                        itemBuilder: (context, index) => MiniBoxes(
                            weather: listofMiniWeatherModel[index],
                            isfirst: index == 0),
                      );
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
