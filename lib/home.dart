import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weatherapp/city.dart';
import 'package:weatherapp/comp/hourlyTemp.dart';
import 'package:weatherapp/comp/selectedCity.dart';
import 'package:weatherapp/forecast.dart';
import 'package:weatherapp/model/current_weathear.dart';
import 'package:weatherapp/model/hourlyInfo.dart';
// import 'package:weatherapp/model/tools.dart';

class HomeScreen extends StatefulWidget {
  var city='Rajkot';
  HomeScreen({super.key,city}){
    if(city!=null){
      this.city=city;
    }
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<Map<String, dynamic>> fetchWeatherData() async {
    var currentWeather = await getCurrentWeather(widget.city.toString());
    var hourlyInfo = await getHourlyInfo(widget.city.toString());
    return {
      'currentWeather': currentWeather,
      'hourlyInfo': hourlyInfo,
    };
  }

    @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.withGreen(90)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => City(),)),
                child: Icon(Icons.menu_rounded,color: Colors.white,size: 35,)
            ),
            title: Text(
            widget.city.toString(),
              style: GoogleFonts.nunito(color: Colors.white, fontSize: 26),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leadingWidth: 50,
            titleSpacing: 5,
          ),
          body: FutureBuilder(
            future: fetchWeatherData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.inkDrop(color: Colors.white, size: 50)
              );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error loading weather data', style: GoogleFonts.nunito(color: Colors.white)));
              } else if (snapshot.hasData) {
                return ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Column(
                        children: [
                          FutureBuilder(
                            future: getCurrentWeather(widget.city.toString()),
                            builder: (context, snapshot) {
                              if(snapshot.hasData){
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                        child: Center(
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    snapshot.data['condition'],
                                                    style: GoogleFonts.nunito(
                                                        color: Colors.white, fontSize: 16),
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(20),
                                                          child: Image.asset(
                                                              snapshot.data['img']),
                                                        ),
                                                        height: 150,
                                                      ),
                                                      Text(
                                                        snapshot.data['temp'].toString()+ "°",
                                                        style: GoogleFonts.nunito(
                                                            color: Colors.white,
                                                            fontSize: 70,
                                                            fontWeight: FontWeight.w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    snapshot.data['time'],
                                                    style: GoogleFonts.nunito(
                                                        color: Colors.white, fontSize: 15),
                                                  ),
                                                )
                                              ],
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: Center(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(25),
                                          child: BackdropFilter(
                                            filter:
                                            ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                            child: Container(
                                              height: 120,
                                              decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.2),
                                                borderRadius: BorderRadius.circular(25),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(18.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.transparent,
                                                        borderRadius: BorderRadius.circular(25),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                                "assets/images/umbrella.png"),
                                                            height: 40,
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets.only(top: 5),
                                                            child: Text(
                                                              snapshot.data['precipitation'],
                                                              style: GoogleFonts.nunito(
                                                                  color: Colors.white,
                                                                  fontSize: 15),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              'Precipitation',
                                                              style: GoogleFonts.nunito(
                                                                  color: Colors.white,
                                                                  fontSize: 12),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width:
                                                        30), // Increased space between the columns
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.transparent,
                                                        borderRadius: BorderRadius.circular(25),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                                "assets/images/water.png"),
                                                            height: 40,
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets.only(top: 5),
                                                            child: Text(
                                                              snapshot.data['humidity'],
                                                              style: GoogleFonts.nunito(
                                                                  color: Colors.white,
                                                                  fontSize: 15),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              'Humidity',
                                                              style: GoogleFonts.nunito(
                                                                  color: Colors.white,
                                                                  fontSize: 12),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width:
                                                        30), // Increased space between the columns
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.transparent,
                                                        borderRadius: BorderRadius.circular(25),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              "assets/images/wind.png",color: Colors.white,),
                                                            height: 40,
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets.only(top: 5),
                                                            child: Text(
                                                              snapshot.data['windSpeed'],
                                                              style: GoogleFonts.nunito(
                                                                  color: Colors.white,
                                                                  fontSize: 15),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              'Wind Speed',
                                                              style: GoogleFonts.nunito(
                                                                  color: Colors.white,
                                                                  fontSize: 12),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                              else{
                                return Center(
                                  // child: LoadingAnimationWidget.inkDrop(color: Colors.white, size: 50)
                                );
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      'Today',
                                      style: GoogleFonts.nunito(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Forecast(),)),
                                    child: Container(
                                      child: Text(
                                        '7-Day Forecasts',
                                        style: GoogleFonts.nunito(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(height: 170, child: HourlyTemp()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      'Other Cities',
                                      style: GoogleFonts.nunito(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 240,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(height: 100, child: SelectedCity()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]);
              }
              else{
                return Center(
                    child: LoadingAnimationWidget.inkDrop(color: Colors.white, size: 50)
                );

              }
            },
          ),
        ),
      ),
    );
  }
}
