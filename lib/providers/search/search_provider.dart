import 'package:flutter/material.dart';
import 'package:weather_app/data/models/search_model.dart';
import 'package:weather_app/data/repository/weather_repo.dart';

class SearchProvider with ChangeNotifier{
  WeatherRepo repo;
  List<SearchModel1> items = [];
  bool loading = false;

  SearchProvider(this.repo);

  SearchRegion(String city) async{
    loading = true;
    notifyListeners();
    items = await repo.searchRegions(city);
    loading = false;
    notifyListeners();
  }
}