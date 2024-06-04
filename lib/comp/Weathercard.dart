import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Weathercard extends StatefulWidget {
  const Weathercard({super.key});

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
            height: 260,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius:
                const BorderRadius.all(Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0,left: 4,right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: ClipRRect(
                            child: Image.asset("assets/images/img_2.png"),
                          ),
                          height: 150,
                        ),
                        Column(
                          children: [
                            Text("Tommorrow",style: GoogleFonts.nunito(fontSize: 15,color: Colors.white)),
                            Text("Mostly Sunny",style: GoogleFonts.nunito(fontSize: 20,color: Colors.white)),
                            Row(children: [
                              Text("30"+"°",style: GoogleFonts.nunito(fontSize: 43,color: Colors.white)),
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Text("/"+"30"+"°",style: GoogleFonts.nunito(fontSize: 21,color: Colors.white)),
                              ),
                            ],)

                          ],
                        ),
                        SizedBox(width: 20,),

                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(children: [
                          Container(
                            child: ClipRRect(
                              child: Image.asset("assets/images/img_2.png"),
                            ),
                            height: 45,
                          ),
                          Text("22"+"%",style: GoogleFonts.nunito(fontSize: 17,color: Colors.white)),
                          Text("Precipation",style: GoogleFonts.nunito(fontSize: 13,color: Colors.white)),],),
                      ),
                      Expanded(
                        child: Column(children: [
                          Container(
                            child: ClipRRect(
                              child: Image.asset("assets/images/img_2.png"),
                            ),
                            height: 45,
                          ),
                          Text("18"+"%",style: GoogleFonts.nunito(fontSize: 17,color: Colors.white)),
                          Text("UV",style: GoogleFonts.nunito(fontSize: 13,color: Colors.white)),],),
                      ),
                      Expanded(
                        child: Column(children: [
                          Container(
                            child: ClipRRect(
                              child: Image.asset("assets/images/img_2.png"),
                            ),
                            height: 45,
                          ),
                          Text("22 "+"Km/h",style: GoogleFonts.nunito(fontSize: 17,color: Colors.white)),
                          Text("Wind Speed",style: GoogleFonts.nunito(fontSize: 13,color: Colors.white)),],),
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