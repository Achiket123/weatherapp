part of 'databloc.dart';


sealed class WeatherEvent{}


class RequestingData extends WeatherEvent{
  RequestingData();
  requestAndUpdate()async{
    print('requesting');
    await backend();
    print('successfully fetched data');
  }
}