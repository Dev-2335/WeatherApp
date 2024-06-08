import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/comp/city_card.dart';
import 'package:weatherapp/comp/searchListCard.dart';
import 'package:weatherapp/home.dart';
import 'package:weatherapp/model/city_model.dart';
import 'package:weatherapp/model/tools.dart';

class City extends StatefulWidget {
  const City({super.key});

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  var cityController = TextEditingController();
  List<String> _suggestions = [];
  final String apiKey = 'AIzaSyAK502s8EsSZNmRb-4jq3Q3y0bedPnmEjc';

  void _onChanged(String input) async {
    print(input);
    if (input.isEmpty) {
      setState(() {
        _suggestions = [];
      });
    }

    try {
      final suggestions = await getCityAutocompleteSuggestions(input, apiKey);
      setState(() {
        _suggestions = suggestions;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.withGreen(105)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: InkWell(
              child: const Icon(
                CupertinoIcons.back,
                color: Colors.white,
              ),
              onTap: () => Navigator.pop(context),
            ),
            title: Text(
              "City",
              style: GoogleFonts.nunito(color: Colors.white, fontSize: 26),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leadingWidth: 50,
            titleSpacing: 5,
          ),
          body: Container(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: CupertinoSearchTextField(
                      controller: cityController,
                      onChanged: _onChanged,
                      style: const TextStyle(color: Colors.white),
                      itemColor: Colors.white,
                      placeholderStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      backgroundColor: const Color.fromRGBO(255, 255, 255, 190),
                    )),
                const SizedBox(
                  height: 10,
                ),
                cityController.text.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: _suggestions.length,
                          itemBuilder: (context, index) {
                            return SearchListCard(city: _suggestions[index]);
                          },
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: saved_citys.length,
                          itemBuilder: (context, index) {
                            return CityCard(
                              address: saved_citys[index]['city'],
                            );
                          },
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
