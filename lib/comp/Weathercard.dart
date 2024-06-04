import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Weathercard extends StatefulWidget {
  var data;
  Weathercard({super.key,required this.data});

  @override
  State<Weathercard> createState() => _WeathercardState();
}

class _WeathercardState extends State<Weathercard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            width: 380,
            height: 350,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius:
                const BorderRadius.all(Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0,left: 4,right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: ClipRRect(
                            child: Image.asset(widget.data['dayimg'],),
                          ),
                          height: 150,
                        ),
                        Column(
                          children: [
                            Text("Tommorrow",style: GoogleFonts.nunito(fontSize: 17,color: Colors.white)),
                            Text(widget.data['condition'],style: GoogleFonts.nunito(fontSize: 22   ,color: Colors.white)),
                            Row(children: [
                              Text(widget.data['maxTemp'].toString()+"°",style: GoogleFonts.nunito(fontSize: 46,color: Colors.white,fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Text("/"+widget.data['minTemp'].toString()+"°",style: GoogleFonts.nunito(fontSize: 21,color: Colors.white)),
                              ),
                            ],)

                          ],
                        ),
                        SizedBox(width: 20,),

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(children: [
                          Container(
                            child: ClipRRect(
                              child: Image.asset("assets/images/umbrella.png"),
                            ),
                            height: 60,
                          ),
                          SizedBox(height: 3,),
                          Text(widget.data['precipitation'].toString(),style: GoogleFonts.nunito(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold)),
                          Text("Precipation",style: GoogleFonts.nunito(fontSize: 14,color: Colors.white)),],),
                      ),
                      Expanded(
                        child: Column(children: [
                          Container(
                            child: ClipRRect(
                              child: Image.asset("assets/images/sun.png"),
                            ),
                            height: 60,
                          ),
                          SizedBox(height: 3,),
                          Text(widget.data['uvIndex'].toString(),style: GoogleFonts.nunito(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold)),
                          Text("UV",style: GoogleFonts.nunito(fontSize: 14,color: Colors.white)),],),
                      ),
                      Expanded(
                        child: Column(children: [
                          Container(
                            child: ClipRRect(
                              child: Image.asset("assets/images/wind.png",color: Colors.white,),
                            ),
                            height: 60,
                          ),
                          SizedBox(height: 3,),
                          Text(widget.data['windSpeed'].toString(),style: GoogleFonts.nunito(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold)),
                          Text("Wind Speed",style: GoogleFonts.nunito(fontSize: 14,color: Colors.white)),],),
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}