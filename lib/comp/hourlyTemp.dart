import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HourlyTemp extends StatelessWidget {
  final List<dynamic> hourlyInfo;

  HourlyTemp({required this.hourlyInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: hourlyInfo.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
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
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            hourlyInfo[index]['time'],
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
                              child: Image.asset(hourlyInfo[index]['condition']['dayimg']),
                            ),
                            height: 55,
                          ),
                        ),
                        Container(
                          child: Text(
                            hourlyInfo[index]['temp'].toString() + '°',
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
        );
      },
    );
  }
}