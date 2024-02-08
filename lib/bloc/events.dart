part of 'databloc.dart';


sealed class WeatherEvent{}


class RequestingData extends WeatherEvent{
  RequestingData();
  requestAndUpdate()async{
    print('requesting');
    backend();
    print('successfully fetched data');
  }
}