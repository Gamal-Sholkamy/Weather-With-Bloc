import 'package:flutter/material.dart';

class CustomWeatherColumn extends StatelessWidget{
  DateTime timeAt;
  String iconAt;
  double tempAt;
  CustomWeatherColumn({required this.timeAt,required this.iconAt,required this.tempAt,});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 120,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children:  [
          Text("${timeAt.hour}:${timeAt.minute}"),
          Image.network(iconAt),
          Text('$tempAt'),
        ],
      ),

    );
  }
}