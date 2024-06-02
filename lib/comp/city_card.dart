import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/model/city_model.dart';

class CityCard extends StatefulWidget {
  const CityCard({super.key});

  @override
  State<CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cityData(22.2916, 70.7932),
      builder: (context, snapshot){
        print(snapshot.data);
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                width: 380,
                height: 180,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0,left: 4,right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(snapshot.data['curr'].toString()+"°C",style: GoogleFonts.nunito(fontSize: 50,color: Colors.white)),
                            SizedBox(width: 20,),
                            Container(
                              child: ClipRRect(
                                child: Image.asset(snapshot.data['cond']['dayimg'].toString()),
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
                            Text("H:"+snapshot.data['high'][0].toString()+"°C",style: GoogleFonts.nunito(fontSize: 15,color: Colors.white70)),
                            SizedBox(width: 10,),
                            Text("L:"+snapshot.data['low'][0].toString()+"°C",style: GoogleFonts.nunito(fontSize: 15,color: Colors.white70))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 2),
                        child: Row(
                          children: [
                            Expanded(child: Text("Rajkot, Gujarat",style: GoogleFonts.nunito(fontSize: 20,color: Colors.white)),flex:5),
                            Expanded(child: Text(snapshot.data['cond']['description'].toString(),style: GoogleFonts.nunito(fontSize: 14,color: Colors.white)),flex:2),
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
    );
  }
}
