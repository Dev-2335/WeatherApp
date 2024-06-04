import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedCity extends StatefulWidget {
  const SelectedCity({super.key});

  @override
  State<SelectedCity> createState() => _SelectedCityState();
}

class _SelectedCityState extends State<SelectedCity> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (index) => Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 5.0), // Adjust the spacing
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  height: 20,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset("assets/images/img_2.png"),
                              ),
                              height: 70,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 5.0),
                            child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'New Zealand',
                                    style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Snowy',
                                    style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              child: Text(
                                '9' + '°',
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
