import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_with_bloc/blocs/home_bloc/app_bloc.dart';
import 'package:weather_with_bloc/blocs/home_bloc/home_states.dart';

import '../../data/models/weather_model.dart';

class SearchScreen extends StatelessWidget{
  final TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder<AppBloc,AppStates>(
          builder: (context,state){
            AppBloc appBloc =AppBloc.get(context);
            return  Column(
                children:  [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      onFieldSubmitted: (value)async{
                        await appBloc.getAreaWeather(value);
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
                          onPressed: () async{
                              await appBloc.getAreaWeather(controller.text);
                              Navigator.pop(context);
                              print('hello2');


                          },
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