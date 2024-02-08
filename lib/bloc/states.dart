part of 'databloc.dart';

sealed class WeatherState{}

class InitialState extends WeatherState{
  List<Weather> listofWeather;
  InitialState({required this.listofWeather});
}

class SuccessState extends WeatherState{
   List<Weather> listofWeather;
  SuccessState({required this.listofWeather});
  
}



class FailureState extends WeatherState{
  String error;
  FailureState({required this.error});
}