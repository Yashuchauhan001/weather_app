import 'package:flutter/material.dart';
import 'package:weather_app/data/models/current_model.dart';
import 'package:weather_app/data/models/current_weather_response.dart';
import 'package:weather_app/data/models/location_model.dart';
import 'package:weather_app/data/repository/weather_repo.dart';

class HomeProvider with ChangeNotifier{
  WeatherRepo repo;
  LocationModel? location;
  CurrentModel? current;
  bool loading = false;

  HomeProvider(this.repo){
    getCurrentWeather('India');

  }

  getCurrentWeather(String city) async{
    loading; true;
    notifyListeners();
    CurrentWeatherResponse? response = await repo.getCurrentWeather(city);
    print(response);
    if(response != null) {
      location = response.location;
       current = response.current;
    }
    loading = false;
    notifyListeners();

  }
}