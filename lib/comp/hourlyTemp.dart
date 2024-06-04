import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HourlyTemp extends StatefulWidget {
  const HourlyTemp({super.key});

  @override
  State<HourlyTemp> createState() => _HourlyTempState();
}

class _HourlyTempState extends State<HourlyTemp> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
              (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0), // Adjust the spacing
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 0.0),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              '10' + 'AM',
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset("assets/images/img_2.png"),
                              ),
                              height: 55,
                            ),
                          ),

                          Container(
                            child: Text(
                              '23'+'°',
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 15,
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
