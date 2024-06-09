import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weatherapp/city.dart';
import 'package:weatherapp/comp/hourlyTemp.dart';
import 'package:weatherapp/comp/selectedCity.dart';
import 'package:weatherapp/forecast.dart';
import 'package:weatherapp/model/city_model.dart';
import 'package:weatherapp/model/current_weathear.dart';
import 'package:weatherapp/model/hourlyInfo.dart';
import 'package:weatherapp/model/tools.dart';
// import 'package:weatherapp/model/tools.dart';

Future<Map<String, dynamic>> fetchWeatherData(String city) async {
  var currentWeather = await getCurrentWeather(city);
  var hourlyInfo = await getHourlyInfo(city);
  return {
    'currentWeather': currentWeather,
    'hourlyInfo': hourlyInfo,
  };
}

class HomeScreen extends StatefulWidget {
  var city = 'Rajkot';
  HomeScreen({super.key, city}) {
    if (city != null) {
      this.city = city;
    }
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Widget saved;
    Widget menu;
    if(widget.city==current_location){
      saved=const Row(
        children: [
          Icon(CupertinoIcons.location_solid,color: Colors.white,),
          SizedBox(width: 10,)
        ],
      );
    }
    else{
      var check;
      var del;
      for(int i=0;i<saved_citys.length;i++){
        if(saved_citys[i]['city']==widget.city){
          check=1;
          del=i;
          break;
        }
      }
      if(check==1){
        saved=InkWell(
          onTap: () { 
            delete_city(del);
            setState(() {
              saved=const Row(
              children: [
                Icon(CupertinoIcons.location_solid,color: Colors.white,),
                SizedBox(width: 10,)
              ],
            );
            });
          },
          child: const Row(
            children: [
              Icon(CupertinoIcons.bookmark_fill,color: Colors.white,),
              SizedBox(width: 10,)
            ],
          ),
        );
      }
      else{
        saved=InkWell(
          onTap: (){
            save_city(widget.city);
            setState(() {
              saved=const Row(
              children: [
                Icon(CupertinoIcons.bookmark_fill,color: Colors.white,),
                SizedBox(width: 10,)
              ],
            );
            });
          },
          child: const Row(
            children: [
              Icon(CupertinoIcons.bookmark,color: Colors.white,),
              SizedBox(width: 10,)
            ],
          ),
        );
      }
    }

    if(widget.city==current_location){
      menu=InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => City(),)),
          child: Icon(Icons.menu_rounded,color: Colors.white,size: 35,)
      );
    }
    else{
      menu=InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(CupertinoIcons.back,color: Colors.white,),
      );
    }

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.withGreen(90)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: menu,
            actions: [saved],
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
            future: fetchWeatherData(widget.city),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: LoadingAnimationWidget.inkDrop(
                        color: Colors.white, size: 50));
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Error loading weather data',
                        style: GoogleFonts.nunito(color: Colors.white)));
              } else if (snapshot.hasData) {
                var currentWeather = snapshot.data!['currentWeather'];
                var hourlyInfo = snapshot.data!['hourlyInfo'];

                return ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Column(
                        children: [
                          FutureBuilder(
                            future: getCurrentWeather(widget.city.toString()),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
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
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 150,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: Image.asset(
                                                          snapshot.data['img']),
                                                    ),
                                                  ),
                                                  Text(
                                                    "${snapshot.data['temp']}°",
                                                    style: GoogleFonts.nunito(
                                                        color: Colors.white,
                                                        fontSize: 70,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                snapshot.data['time'],
                                                style: GoogleFonts.nunito(
                                                    color: Colors.white,
                                                    fontSize: 15),
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
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 10.0, sigmaY: 10.0),
                                            child: Container(
                                              height: 120,
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 40,
                                                            child: Image.asset(
                                                                "assets/images/umbrella.png"),
                                                          ),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 5),
                                                            child: Text(
                                                              snapshot.data[
                                                                  'precipitation'],
                                                              style: GoogleFonts
                                                                  .nunito(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              'Precipitation',
                                                              style: GoogleFonts
                                                                  .nunito(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            30), // Increased space between the columns
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 40,
                                                            child: Image.asset(
                                                                "assets/images/water.png"),
                                                          ),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 5),
                                                            child: Text(
                                                              snapshot.data[
                                                                  'humidity'],
                                                              style: GoogleFonts
                                                                  .nunito(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              'Humidity',
                                                              style: GoogleFonts
                                                                  .nunito(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            30), // Increased space between the columns
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 40,
                                                            child: Image.asset(
                                                              "assets/images/wind.png",
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 5),
                                                            child: Text(
                                                              snapshot.data[
                                                                  'windSpeed'],
                                                              style: GoogleFonts
                                                                  .nunito(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              'Wind Speed',
                                                              style: GoogleFonts
                                                                  .nunito(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12),
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
                              } else {
                                return Container();
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
                                  const SizedBox(
                                    width: 200,
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Forecast(),
                                        )),
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
                            child: SizedBox(
                                height: 170,
                                child: HourlyTemp(
                                  hourlyInfo: hourlyInfo,
                                )),
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
                                  const SizedBox(
                                    width: 240,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: SizedBox(
                                height: 110,
                                width: 1000,
                                child: SelectedCity()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]);
              } else {
                return Center(
                    child: LoadingAnimationWidget.inkDrop(
                        color: Colors.white, size: 50));
              }
            },
          ),
        ),
      ),
    );
  }
}
