import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/model/condition.dart';
import 'package:weatherapp/model/tools.dart';
class City_cuurent_weather{
  var curr;
  var high;
  var low;
  var name;
  var state;
  var cond;
}

Future<dynamic> cityData(var lat,var lon) async {
  var res = await http.get(Uri.parse("https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,is_day&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto&forecast_days=1"));
  var dt=jsonDecode(res.body);
  print(dt);
  Map<String,dynamic> data={
    "curr": dt['current']['temperature_2m'],
    "high": dt['daily']['temperature_2m_max'],
    "low": dt['daily']['temperature_2m_min'],
    // "name": dt[''][''],
    // "state": dt[''][''],
    "cond": weatherCodes[dt['daily']['weather_code'][0]],
    "isday":dt['current']['is_day'],
  };
  print(data);
  return data;
}

List<dynamic> saved_citys=[
  {}
];