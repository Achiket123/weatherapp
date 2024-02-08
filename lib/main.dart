
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weatherapp/bloc/databloc.dart';
import 'package:weatherapp/functions/backend.dart';
import 'package:weatherapp/functions/functions.dart';
import 'package:weatherapp/pages/homepage.dart';
import 'package:weatherapp/someconst.dart';

const APIKEY = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await permission();
  await Hive.initFlutter();
  final _box = await Hive.openBox(openBox);
  preload();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_)=>WeatherBloc()
       ,
       child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
       )
    );
  }
}
