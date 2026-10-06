import 'package:flutter/material.dart';
import 'package:weather_app/data/models/current_model.dart';
import 'package:weather_app/data/models/location_model.dart';
import 'package:weather_app/data/repository/weather_repo.dart';

import '../../data/models/current_weather_response.dart';

class WeatherProvider with ChangeNotifier {
  WeatherRepo repo;
  bool loading = false;
  LocationModel? location;
  CurrentModel? current;

  WeatherProvider(this.repo);

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