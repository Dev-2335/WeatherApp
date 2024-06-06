import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weatherapp/model/hourlyInfo.dart';

class HourlyTemp extends StatefulWidget {
  final List<dynamic> hourlyInfo;

  const HourlyTemp({required this.hourlyInfo, super.key});

  @override
  State<HourlyTemp> createState() => _HourlyTempState();
}

class _HourlyTempState extends State<HourlyTemp> {
  @override
  Widget build(BuildContext context) {
    print("  data:  ${widget.hourlyInfo}");
    return FutureBuilder(
        future: getHourlyInfo('rajkot'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.hourlyInfo.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  // Adjust the spacing
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 0.0),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    widget.hourlyInfo[index]['time'],
                                    style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    height: 55,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          widget.hourlyInfo[index]['condition']
                                              ['dayimg']),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '${widget.hourlyInfo[index]['temp']}°',
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
          } else {
            return Container();
          }
        });
  }
}
