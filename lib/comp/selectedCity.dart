import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/model/city_model.dart';

import '../home.dart';

class SelectedCity extends StatefulWidget {
  const SelectedCity({super.key});

  @override
  State<SelectedCity> createState() => _SelectedCityState();
}

class _SelectedCityState extends State<SelectedCity> {
  @override
  Widget build(BuildContext context) {
    var img;
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: saved_citys.length,
        itemBuilder: (context, index) =>
          FutureBuilder(
              future: cityData(saved_citys[index]['lat'], saved_citys[index]['lon']),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  if(snapshot.data['isday']==1){
                    img=snapshot.data['cond']['dayimg'].toString();
                  }
                  else{
                    img=snapshot.data['cond']['nightimg'].toString();
                  }
                  return InkWell(
                    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(city: snapshot.data['city'],),)),
                    child: Padding(
                      padding:
                      EdgeInsets.all(2.0), // Adjust the spacing
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            height: 20,
                            width: 325,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(img),
                                        ),
                                        height: 70,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 18.0, horizontal: 5.0),
                                      child: Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  saved_citys[index]['city'],
                                                  style: GoogleFonts.nunito(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  snapshot.data['cond']['description'].toString(),
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
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Container(
                                        child: Text(
                                          snapshot.data['curr'].toString()+ '°',
                                          style: GoogleFonts.nunito(
                                            color: Colors.white,
                                            fontSize: 30,
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
                  );
                }
                else{
                  return Container();
                }
              },
          )
        ),
      );
  }
}
