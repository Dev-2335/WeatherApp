import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/comp/Dayscard.dart';
import 'package:weatherapp/comp/Weathercard.dart';


class Forecast extends StatefulWidget {
  const Forecast({super.key});

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blue.shade400, Colors.blue.withGreen(105)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: Icon(CupertinoIcons.back,color: Colors.white,),
            title: Text("Forecast",style: GoogleFonts.nunito(color: Colors.white,fontSize: 26),),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leadingWidth: 50,
            titleSpacing: 5,
          ),
          body: Container(
            child: Container  (
              child: Column(
                children: [
                 Weathercard(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Dayscard();
                      },
                    ),
                  )
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}
