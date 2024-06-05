import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/comp/hourlyTemp.dart';
import 'package:weatherapp/comp/selectedCity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu_rounded,
                size: 35,
              ),
              color: Colors.white,
            ),
            title: Text(
              "Rajkot",
              style: GoogleFonts.nunito(color: Colors.white, fontSize: 26),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leadingWidth: 50,
            titleSpacing: 5,
          ),
          body: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Center(
                            child: Column(
                          children: [
                            Container(
                              child: Text(
                                "Mostly Sunny",
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
                                          "assets/images/img_2.png"),
                                    ),
                                    height: 150,
                                  ),
                                  Text(
                                    "23" + "°",
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 85,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Text(
                                "Saturday, 10 February | 10:00 AM",
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
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                  "assets/images/img_2.png"),
                                            ),
                                            height: 40,
                                          ),
                                          Container(
                                            child: Text(
                                              '30' + '%',
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
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                  "assets/images/img_2.png"),
                                            ),
                                            height: 40,
                                          ),
                                          Container(
                                            child: Text(
                                              '20' + '%',
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
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                  "assets/images/img_2.png"),
                                            ),
                                            height: 40,
                                          ),
                                          Container(
                                            child: Text(
                                              '9' + 'km/h',
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
                            Container(
                              child: Text(
                                '7-Day Forecasts',
                                style: GoogleFonts.nunito(
                                    color: Colors.white, fontSize: 15),
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
                            )
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
          ]),
        ),
      ),
    );
  }
}
