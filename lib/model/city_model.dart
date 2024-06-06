import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/model/condition.dart';
import 'package:weatherapp/model/tools.dart';

Future<dynamic> cityData(String address) async {
  print(address);
  Map<String, double> coordinates = await getAddressToCoordinates(address);
  double lat = coordinates['latitude']!, lon = coordinates['longitude']!;
  var res = await http.get(Uri.parse(
      "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,is_day&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto&forecast_days=1"));
  var dt = jsonDecode(res.body);
  var loc = await getCoordinatesToAddress({"latitude": lat, "longitude": lon});
  Map<String, dynamic> data = {
    "curr": dt['current']['temperature_2m'],
    "high": dt['daily']['temperature_2m_max'],
    "low": dt['daily']['temperature_2m_min'],
    "city": loc['city'],
    "country": loc['country'],
    "cond": weatherCodes[dt['daily']['weather_code'][0]],
    "isday": dt['current']['is_day'],
  };
  return data;
}

List<dynamic> saved_citys = [
  {"city": "Rajkot", "lat": 22.2916, "lon": 70.7932},
  {"city": "Dubai", "lat": 25.2048, "lon": 55.2708},
  {"city": "Ahemdabad", "lat": 23.0225, "lon": 72.5714},
  {"city": "Amsterdam", "lat": 52.3676, "lon": 4.9041},
];
