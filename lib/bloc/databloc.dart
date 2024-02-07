
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/functions/backend.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/someconst.dart';
part 'events.dart';

class ListOFWeatherBloc extends Bloc<UpdatingWeather,List<Weather>>{
  ListOFWeatherBloc():super(listofWeather){
    on<UpdatingWeather>((event, emit) async {
    await  backend();
     List<Weather> newListofWeather =[...listofWeather];
     emit(newListofWeather);
    });
  }
  @override
  void onChange(Change<List<Weather>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}


class listofMiniWeatherBloc extends Bloc<UpdatingWeather,List<MiniWeatherModel>>{
  listofMiniWeatherBloc():super(listofMiniWeatherModel){
    on<UpdatingWeather>((event, emit) async {
    await  backend();
     List<MiniWeatherModel> newListofWeather =[...listofMiniWeatherModel];
     emit(newListofWeather);
    });

  }
   @override
  void onChange(Change<List<MiniWeatherModel>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
