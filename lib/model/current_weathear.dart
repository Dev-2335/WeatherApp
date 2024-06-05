  import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weatherapp/model/condition.dart';
import 'package:weatherapp/model/tools.dart';

Future<dynamic> getCurrentWeather(String address) async {
  Map<String, double> coordinates = await getAddressToCoordinates(address);
  double lat = coordinates['latitude']!, log = coordinates['longitude']!;
  Map address1 =
      await getCoordinatesToAddress({"latitude": lat, "longitude": log});
  String city = address1['city'];
  final String apiUrl =
      'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$log&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,weather_code,surface_pressure,wind_speed_10m&daily=temperature_2m_max,temperature_2m_min,sunrise,sunset,uv_index_max,precipitation_probability_max&timezone=auto&forecast_days=1';
  final response = await http.get(Uri.parse(apiUrl));
  final Map<String, dynamic> dt = json.decode(response.body);
  final Map<String, dynamic> data = {
    'city': city,
    "condition": weatherCodes[dt['current']['weather_code']]!['description'],
    "temp": dt['current']['temperature_2m'],
    "time": DateFormat('EEEE, d MMMM | hh:mm a')
        .format(DateTime.parse(dt['current']['time'])),
    "precipitation": "${dt['daily']['precipitation_probability_max'][0]}%",
    "humidity": "${dt['current']['relative_humidity_2m']}%",
    "windSpeed": "${dt['current']['wind_speed_10m']}km/h",
    "img": getDayOrNightImage(dt['daily']['sunrise'][0],
        dt['daily']['sunset'][0], dt['current']['weather_code']),
  };
  print(data);
  return data;
}
