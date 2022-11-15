import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_with_bloc/blocs/home_bloc/home_states.dart';
import 'package:weather_with_bloc/data/models/weather_model.dart';
import 'package:weather_with_bloc/data/services/weather_service.dart';

class AppBloc extends Cubit<AppStates>{
  AppBloc():super(HomeInitialState());
  static AppBloc get(context)=>BlocProvider.of(context);
 WeatherModel? weatherModel;
 Future<void> getAreaWeather(String areaName)async{
   emit(HomeGettingWeatherLoadingState());
   try{
     WeatherService weatherService=WeatherService();
     weatherModel=await weatherService.getAreaWeather(areaName: areaName);
     emit(HomeGettingWeatherLoadedState(weatherModel: weatherModel!));

   }
   catch(ex){
     print('an $ex occur');
      emit(HomeGettingWeatherErrorState());
   }




 }

}