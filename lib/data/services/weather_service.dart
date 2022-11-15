import 'dart:convert';
import 'package:weather_with_bloc/data/end_points.dart';
import 'package:weather_with_bloc/data/models/weather_model.dart';
import 'package:http/http.dart'as http;

class WeatherService{

  Future<WeatherModel> getAreaWeather({required String areaName})async{
    WeatherModel? weatherModel;

      Uri url=Uri.parse("$baseURL/forecast.json?key=$apiKey&q=$areaName&days=2&aqi=no&alerts=no");
      http.Response response=await http.get(url);
      Map<String,dynamic> data=jsonDecode(response.body);
      weatherModel=WeatherModel.fromJson(data);
      return weatherModel;



  }

}