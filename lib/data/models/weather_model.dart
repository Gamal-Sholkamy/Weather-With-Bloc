class WeatherModel{
  String cityName;
  DateTime date;
  String icon;
  double temp;
  double maxTemp;
  double minTemp;
  double avrTemp;
  String weatherStateName;
  /////////الساعة كل 4 ساعات///////
  DateTime timeAt12AM;
  DateTime timeAt4AM;
  DateTime timeAt8AM;
  DateTime timeAt12PM;
  DateTime timeAt4PM;
  DateTime timeAt8PM;
  /////درجة الحرارة كل 4 ساعات////
  double tempAt12AM;
  double tempAt4AM;
  double tempAt8AM;
  double tempAt12PM;
  double tempAt4PM;
  double tempAt8PM;
  ////////ايقونة درجة الحرارة كل 4 ساعات/////////
  String iconAt12AM;
  String iconAt4AM;
  String iconAt8AM;
  String iconAt12PM;
  String iconAt4PM;
  String iconAt8PM;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.icon,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.avrTemp,
    required this.weatherStateName,
    ///////
    required this.timeAt12AM,
    required this.timeAt4AM,
    required this.timeAt8AM,
    required this.timeAt12PM,
    required this.timeAt4PM,
    required this.timeAt8PM,
    ////
    required this.tempAt12AM,
    required this.tempAt4AM,
    required this.tempAt8AM,
    required this.tempAt12PM,
    required this.tempAt4PM,
    required this.tempAt8PM,
    /////////
    required this.iconAt12AM,
    required this.iconAt4AM,
    required this.iconAt8AM,
    required this.iconAt12PM,
    required this.iconAt4PM,
    required this.iconAt8PM,

  });

  factory WeatherModel.fromJson(Map <String,dynamic>data){
    var jsonDataDay=data['forecast']['forecastday'][0]['day'];
    var jsonDataHour=data['forecast']['forecastday'][0]['hour'];
    return WeatherModel(
      cityName: data['location']['name'],
      date: DateTime.parse(data['location']['localtime']),
      icon: 'http:${data['current']['condition']['icon']}',
      temp: data['current']['temp_c'],
      maxTemp: jsonDataDay['maxtemp_c'],
      minTemp: jsonDataDay['mintemp_c'],
      avrTemp: jsonDataDay['avgtemp_c'],
      weatherStateName: jsonDataDay['condition']['text'],
      ////
      timeAt12AM: DateTime.parse(jsonDataHour[0]['time']),
      timeAt4AM: DateTime.parse(jsonDataHour[3]['time']),
      timeAt8AM: DateTime.parse(jsonDataHour[7]['time']),
      timeAt12PM: DateTime.parse(jsonDataHour[13]['time']),
      timeAt4PM: DateTime.parse(jsonDataHour[17]['time']),
      timeAt8PM: DateTime.parse(jsonDataHour[21]['time']),
      ////
      tempAt12AM:jsonDataHour[0]['temp_c'],
      tempAt4AM:jsonDataHour[3]['temp_c'] ,
      tempAt8AM:jsonDataHour[7]['temp_c'] ,
      tempAt12PM:jsonDataHour[13]['temp_c'] ,
      tempAt4PM:jsonDataHour[17]['temp_c'] ,
      tempAt8PM:jsonDataHour[21]['temp_c'] ,
      //////
      iconAt12AM:'http:${jsonDataHour[0]['condition']['icon']}' ,
      iconAt4AM:'http:${jsonDataHour[3]['condition']['icon']}' ,
      iconAt8AM:'http:${jsonDataHour[7]['condition']['icon']}' ,
      iconAt12PM:'http:${jsonDataHour[13]['condition']['icon']}' ,
      iconAt4PM:'http:${jsonDataHour[17]['condition']['icon']}' ,
      iconAt8PM:'http:${jsonDataHour[21]['condition']['icon']}',

    );

  }

}