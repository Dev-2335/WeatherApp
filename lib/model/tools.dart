import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/model/condition.dart';

var group0 = [800];
var group1 = [801];
var group2 = [802];
var group3 = [803];
var group45 = [721, 741];
var group48 = [803];
var group51 = [300, 310];
var group53 = [301, 311];
var group55 = [302, 312];
var group56 = [803];
var group57 = [803];
var group61 = [500];
var group63 = [501];
var group65 = [502, 503, 504];
var group66 = [511, 615];
var group67 = [80, 616];
var group71 = [
  600,
];
var group73 = [601];
var group75 = [602, 611];
var group77 = [803];
var group80 = [
  313,
  520,
];
var group81 = [314, 521];
var group82 = [321, 522, 531];
var group85 = [612, 620, 621];
var group86 = [613, 622];
var group95 = [
  200,
  201,
  210,
  221,
];
var group96 = [
  230,
  231,
];
var group99 = [803, 202, 211, 212, 231];
var group1001 = [701];
var group1002 = [711];
var group1004 = [731, 751, 761, 762];
var group10010 = [781, 771];
var groupList = [
  group0,
  group1,
  group2,
  group3,
  group45,
  group48,
  group51,
  group53,
  group55,
  group56,
  group57,
  group61,
  group63,
  group65,
  group67,
  group71,
  group73,
  group75,
  group77,
  group80,
  group81,
  group82,
  group85,
  group86,
  group95,
  group96,
  group99,
  group1001,
  group1002,
  group1004,
  group10010
];
var groupCode = [
  0,
  1,
  2,
  3,
  45,
  48,
  51,
  53,
  55,
  56,
  57,
  61,
  63,
  65,
  67,
  71,
  73,
  75,
  77,
  80,
  81,
  82,
  85,
  86,
  95,
  96,
  99,
  1001,
  1002,
  1004,
  10010
];

bool check(int code, List<int> group) {
  for (int number in group) {
    if (number == code) {
      return true;
    }
  }
  return false;
}

Map<String, String>? codeConverter(int code) {
  for (int i = 0; i < groupList.length; i++) {
    if (check(code, groupList[i])) {
      return weatherCodes[groupCode[i]];
    }
  }
  return {};
}

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
  DateTime endTime = currentTime.add(Duration(hours: 24));

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
  DateTime time = DateTime.parse(timeString).add(Duration(hours: 0));
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
