import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/model/condition.dart';
import 'package:weatherapp/model/tools.dart';

Future<List<Map<String, dynamic>>> getHourlyInfo(String address) async {
  Map<String, double> coordinates = await getAddressToCoordinates(address);
  double lat = coordinates['latitude']!, log = coordinates['longitude']!;
  final String apiUrl =
      'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$log&hourly=temperature_2m,relative_humidity_2m,weather_code,precipitation_probability,precipitation,wind_speed_80m&timezone=auto&forecast_days=3';

  final response = await http.get(Uri.parse(apiUrl));
  final Map<String, dynamic> data = json.decode(response.body);

  //getting dataRange of next 24hours
  var range = await getRangeIndices(data['hourly']['time']);

  List<Map<String, dynamic>> hourlyData = [];
  
  for (int i = range[0] - 1; i <= range[1]; i++) {
    print(data['hourly']['time'][i]);
    hourlyData.add({
      "time": formatTime(data['hourly']['time'][i]),
      "condition": weatherCodes[data['hourly']['weather_code'][i]],
      "temp": data['hourly']['temperature_2m'][i],
      "img": getDayOrNightImage_2(data['hourly']['time'][i],data['hourly']['weather_code'][i])
    });
  }
  print(hourlyData);
  return hourlyData;
}
