import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/model/condition.dart';

Future<Map<String, double>> getAddressToCoordinates(String address) async {
  List<Location> locations = await locationFromAddress(address);
  Map<String, double> coordinates = {
    "latitude": locations.last.latitude,
    "longitude": locations.last.longitude
  };
  return coordinates;
}

Future<Map<String, String>> getCoordinatesToAddress(
    Map<String, double> coordinates) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(
      coordinates['latitude']!, coordinates['longitude']!);
  Map<String, String> Address = {
    "country": placemarks.reversed.last.country.toString(),
    "city": placemarks.reversed.last.locality.toString()
  };
  return Address;
}

List<int> getRangeIndices(List<dynamic> timeList) {
  DateTime currentTime = DateTime.now();
  DateTime endTime = currentTime.add(const Duration(hours: 24));

  int startIndex = -1;
  int endIndex = -1;

  for (int i = 0; i < timeList.length; i++) {
    DateTime time = DateTime.parse(timeList[i]);
    if (time.isAfter(currentTime) && startIndex == -1) {
      startIndex = i;
    }
    if (time.isAfter(endTime) && endIndex == -1) {
      endIndex = i - 1;
      break;
    }
  }

  if (endIndex == -1) {
    endIndex = timeList.length - 1;
  }

  return [startIndex, endIndex];
}

String formatTime(dynamic timeString) {
  DateTime time = DateTime.parse(timeString).add(const Duration(hours: 0));
  String formattedTime = DateFormat('h a').format(time);
  return formattedTime;
}

String getDayOrNightImage(
    String sunriseTimeString, String sunsetTimeString, dynamic index) {
  DateTime sunrise = DateTime.parse(sunriseTimeString);
  DateTime sunset = DateTime.parse(sunsetTimeString);
  DateTime now = DateTime.now();
  if (now.isBefore(sunrise) || now.isAfter(sunset)) {
    return weatherCodes[index]!['nightimg']!;
  } else {
    return weatherCodes[index]!['dayimg']!;
  }
}

Future<List<String>>? getCurrentCity() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

  String city = placemarks[0].locality!;
  return [city];
}

Future<List<String>> getCityAutocompleteSuggestions(
    String input, String apiKey) async {
  final url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json'
      '?input=$input&types=(cities)&key=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == 'OK') {
      final suggestions = data['predictions'] as List;
      final cityCountryList = suggestions
          .map((suggestion) {
            final city = suggestion['terms'].first['value'];
            final country = suggestion['terms'].last['value'];
            return '$city, $country';
          })
          .toSet()
          .toList();
      return cityCountryList;
    } else {
      throw Exception(
          'Error retrieving autocomplete suggestions: ${data['status']}');
    }
  } else {
    throw Exception('Failed to load autocomplete suggestions');
  }
}

var current_location;
