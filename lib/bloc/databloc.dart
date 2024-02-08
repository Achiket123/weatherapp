
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/functions/backend.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/someconst.dart';
import 'package:http/http.dart' as http;
part 'events.dart';
part 'states.dart';

class WeatherBloc extends Bloc<WeatherEvent, List<Weather>> {
  WeatherBloc() : super( listofWeather) {
    on<RequestingData>((event, emit) async{
     await event.requestAndUpdate();
    emit([...listofWeather]);
  
    });
  }
}