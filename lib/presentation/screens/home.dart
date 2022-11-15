import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_with_bloc/blocs/home_bloc/app_bloc.dart';
import 'package:weather_with_bloc/blocs/home_bloc/home_states.dart';
import 'package:weather_with_bloc/data/models/weather_model.dart';
import 'package:weather_with_bloc/presentation/screens/search.dart';
import 'package:weather_with_bloc/presentation/widgets/custom_weather_column.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppBloc,AppStates>(
        builder: (context,state){

          if (state is HomeGettingWeatherLoadedState){
            final AppBloc homeBloc =AppBloc.get(context);
            WeatherModel weatherModel=homeBloc.weatherModel!;

            List<String>timesAt=[weatherModel.timeAt12AM,weatherModel.timeAt4AM,weatherModel.timeAt8AM,
              weatherModel.timeAt12PM,weatherModel.timeAt4PM,weatherModel.timeAt8PM,];

            List<String>iconsAt=[weatherModel.iconAt12AM,weatherModel.iconAt4AM,weatherModel.iconAt8AM,
              weatherModel.iconAt12PM,weatherModel.iconAt4PM,weatherModel.iconAt8PM,
            ];
            List<double>tempsAt=[weatherModel.tempAt12AM,weatherModel.tempAt4AM,weatherModel.tempAt8AM,
              weatherModel.tempAt12PM,weatherModel.tempAt4PM,weatherModel.tempAt8PM,];
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue,Colors.lightBlueAccent,Colors.blueGrey],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                        }, icon: const Icon(Icons.search,size: 35,)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 30),
                      child: Row(
                        children:  [
                          Text("${weatherModel.temp.toInt()}",style: const TextStyle(color:Colors.white,fontSize: 66,fontWeight: FontWeight.normal),),
                          const Spacer(),
                          Image.network(weatherModel.icon,height: 60,width: 60,),
                        ],
                      ),
                    ),
                    Text(weatherModel.cityName,style: const TextStyle(color:Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 40,),
                    Text('last update:${weatherModel.date.hour.toString()}:${weatherModel.date.minute.toString()}',
                      style: const TextStyle(color:Colors.white,fontSize: 28,fontWeight: FontWeight.normal),),
                    const SizedBox(height: 40,),
                    Text("${weatherModel.maxTemp.toInt()} /${weatherModel.minTemp.toInt()} Feels like ${weatherModel.temp}",
                      style: const TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 40,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff8BB8EA).withOpacity(.5),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: ListView.separated
                        (scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index)=>CustomWeatherColumn(timeAt: timesAt[index], iconAt: iconsAt[index], tempAt: tempsAt[index]),
                          separatorBuilder:(context,index)=>const VerticalDivider(thickness: 2,color: Colors.pink,) ,
                          itemCount: timesAt.length),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff8BB8EA).withOpacity(.5),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children:  [
                          const Text("Current Weather State",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                          const SizedBox(height: 10,),
                          Text(weatherModel.weatherStateName,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 18),),
                        ],
                      ),
                    ),


                  ],
                ),
              ),

            );
          }
          else if(state is HomeGettingWeatherErrorState){
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [

                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                    }, icon: const Icon(Icons.search,size: 35,)),
                  ),
                ),
                const Spacer(),
                const Center(
                  child: Text("Try to search for Actual City",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,),
                  ),
                ),
                const Spacer(),
              ],
            );
          }
          else {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [

                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                    }, icon: const Icon(Icons.search,size: 35,)),
                  ),
                ),
                const Spacer(),
                const Center(
                  child: Text("There is no weather 🌨️🌩️😢 start searching Now🔍",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,),
                  ),
                ),
                const Spacer(),
              ],
            );
          }

        },
      ),
    );
  }
}