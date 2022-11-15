import 'package:weather_with_bloc/data/models/weather_model.dart';

abstract class AppStates{}
class HomeInitialState extends AppStates{}
class HomeGettingWeatherLoadingState extends AppStates{}
class HomeGettingWeatherLoadedState extends AppStates{
  final WeatherModel weatherModel;
  HomeGettingWeatherLoadedState({required this.weatherModel});
}
class HomeGettingWeatherErrorState extends AppStates{}