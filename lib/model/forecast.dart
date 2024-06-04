import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weatherapp/model/condition.dart';
import 'package:weatherapp/model/tools.dart';

Future<Map<String, dynamic>> getForecastInfo(String address) async {
  Map<String, double> coordinates = await getAddressToCoordinates(address);
  double lat = coordinates['latitude']!, log = coordinates['longitude']!;
  final String apiUrl =
      'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$log&daily=weather_code,temperature_2m_max,temperature_2m_min,uv_index_max,precipitation_probability_max,sunrise,sunset,wind_speed_10m_max&timezone=auto';

  final response = await http.get(Uri.parse(apiUrl));
  final Map<String, dynamic> data = json.decode(response.body);

  var sunriseTimeString = data['daily']['sunrise'][0],
      sunsetTimeString = data['daily']['sunset'][0];

  //data:
  final Map<String, dynamic> tomorrow = {
    "date":
        DateFormat('d MMM').format(DateTime.parse(data['daily']['time'][0])),
    "maxTemp": data['daily']['temperature_2m_max'][1],
    "minTemp": data['daily']['temperature_2m_min'][1],
    "condition": weatherCodes[data['daily']['weather_code'][1]]!['description'],
    "image": getDayOrNightImage(
        sunriseTimeString, sunsetTimeString, data['daily']['weather_code'][1]),
    "precipitation":
        data['daily']['precipitation_probability_max'][1].toString() + '%',
    "uvIndex": data['daily']['uv_index_max'][1],
    "windSpeed": data['daily']['wind_speed_10m_max'][1].toString() + "km/h",
  };
  final Map<String, dynamic> today = {
    "date":
        DateFormat('d MMM').format(DateTime.parse(data['daily']['time'][0])),
    "maxTemp": data['daily']['temperature_2m_max'][0],
    "minTemp": data['daily']['temperature_2m_min'][0],
    "condition": weatherCodes[data['daily']['weather_code'][0]]!['description'],
    "image": getDayOrNightImage(
        sunriseTimeString, sunsetTimeString, data['daily']['weather_code'][0]),
    "precipitation":
        data['daily']['precipitation_probability_max'][0].toString() + '%',
    "uvIndex": data['daily']['uv_index_max'][0],
    "windSpeed": data['daily']['wind_speed_10m_max'][0].toString() + "km/h",
  };
  final List<Map<String, dynamic>> other = [];

  for (int i = 2; i < 7; i++) {
    other.add({
      "date":
          DateFormat('d MMM').format(DateTime.parse(data['daily']['time'][i])),
      "maxTemp": data['daily']['temperature_2m_max'][i],
      "minTemp": data['daily']['temperature_2m_min'][i],
      "condition":
          weatherCodes[data['daily']['weather_code'][i]]!['description'],
      "image": getDayOrNightImage(sunriseTimeString, sunsetTimeString,
          data['daily']['weather_code'][i]),
    });
  }

  Map<String, dynamic> finalData = {
    "today": today,
    "tomorrow": tomorrow,
    "next5days": other
  };

  print(finalData);

  return finalData;
}
