import 'package:flutter/material.dart';
import 'package:weather_app/data/models/forecastday_model.dart';
import 'package:weather_app/data/repository/weather_repo.dart';

class ForecastProvider with ChangeNotifier{
  WeatherRepo repo;
  List<ForecastdayModel> forecastdays = [];
  bool loading = false;


  ForecastProvider(this.repo){
    getForecast();
  }

  getForecast () async{
    loading = true;
    notifyListeners();
    forecastdays = await repo.getForecast('Amroha', 2);
    loading = false;
    notifyListeners();
  }
}