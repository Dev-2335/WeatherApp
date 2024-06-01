import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CityCard extends StatefulWidget {
  const CityCard({super.key});

  @override
  State<CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            width: 380,
            height: 190,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius:
                const BorderRadius.all(Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("50"+"°C",style: GoogleFonts.nunito(fontSize: 50,color: Colors.white)),
                        SizedBox(width: 20,),
                        Container(
                            child: ClipRRect(
                              child: Image.asset("assets/images/img_2.png"),
                            ),
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0),
                    child: Row(
                      children: [
                        Text("H:55"+"°C",style: GoogleFonts.nunito(fontSize: 17,color: Colors.white70)),
                        SizedBox(width: 10,),
                        Text("L:49"+"°C",style: GoogleFonts.nunito(fontSize: 17,color: Colors.white70))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 8),
                    child: Row(
                      children: [
                        Expanded(child: Text("Rajkot, Gujarat",style: GoogleFonts.nunito(fontSize: 20,color: Colors.white)),flex:3),
                        Expanded(child: Text("Mid Rain",style: GoogleFonts.nunito(fontSize: 13,color: Colors.white)),flex:1),
                      ],
                    ),
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
