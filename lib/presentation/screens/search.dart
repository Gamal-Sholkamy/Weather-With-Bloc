import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_with_bloc/blocs/home_bloc/app_bloc.dart';

import '../../data/models/weather_model.dart';

class SearchScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder(
          builder: (context,state){
            AppBloc appBloc =AppBloc.get(context);
            return  Column(
                children:  [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      onFieldSubmitted: (value)async{
                        WeatherModel model=await appBloc.getAreaWeather(value);
                        Navigator.pop(context);
                        print('hello2');
                      },
                      decoration: InputDecoration(
                        label: const Text("City"),
                        hintText: "Type a City to Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ],

            );
          }
      ),
    );
  }
}