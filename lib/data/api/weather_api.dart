
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/models/current_weather_response.dart';
import 'package:weather_app/data/models/forecastday_model.dart';
import 'package:weather_app/data/models/search_model.dart';

class WeatherApi {
  String baseUrl = 'http://api.weatherapi.com/v1';
  
  Future<CurrentWeatherResponse?> getCurrentWeather(String city) async{
    try{
      final res = await http.get(Uri.parse('$baseUrl/current.json?key=906b0bc23c574f9885b142633261808&q=$city&aqi=no'));
      final data = jsonDecode(res.body);
      CurrentWeatherResponse response = CurrentWeatherResponse.fromJson(data);
      return response;
    }catch(e){
      print(e);
    }
    return null;
  }
  
  Future<List<ForecastdayModel>> getForecast(String city, int days) async{
    try{
      final res = await http.get(Uri.parse('$baseUrl/forecast.json?key=906b0bc23c574f9885b142633261808&q=$city&days=$days&aqi=no&alerts=no'));
      final data = jsonDecode(res.body);
      List dataList = data['forecast']['forecastday'];
      List<ForecastdayModel> forecastdays = dataList.map((e) =>
      ForecastdayModel.fromJson(e)).toList();
      return forecastdays;
    }catch(e){
      print(e);
    }
    return [];
  }


  Future<List<SearchModel1>> searchRegion(String city) async{
    try{
      final res = await http.get(Uri.parse('$baseUrl/v1/search.json?key=906b0bc23c574f9885b142633261808&q=$city'));
      List data = jsonDecode(res.body);
      List<SearchModel1> items = data.map((e) => SearchModel1.fromJson(e)).toList();
      return items;
    }catch(e){
      print(e);
    }
    return [];
  }
}