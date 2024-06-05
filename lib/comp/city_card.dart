import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weatherapp/home.dart';
import 'package:weatherapp/model/city_model.dart';

class CityCard extends StatefulWidget {
  var lat;
  var lon;
  CityCard({super.key,required this.lat,required this.lon});

  @override
  State<CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  @override
  Widget build(BuildContext context) {
    var img;
    return FutureBuilder(
      future: cityData(widget.lat, widget.lon),
      builder: (context, snapshot){
        print(snapshot.data);
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
                                    child: Image.asset(img),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(snapshot.data['city']+","+snapshot.data['country'],style: GoogleFonts.nunito(fontSize: 18,color: Colors.white)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(snapshot.data['cond']['description'].toString(),style: GoogleFonts.nunito(fontSize: 14,color: Colors.white)),
                                ),
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
          );
        }
        else{
          // return Center(
          //     child: LoadingAnimationWidget.inkDrop(color: Colors.white, size: 50)
          // );
          return Container();
        }
      }
    );
  }
}
