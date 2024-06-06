import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weatherapp/comp/Dayscard.dart';
import 'package:weatherapp/comp/Weathercard.dart';
import 'package:weatherapp/model/forecast.dart';

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
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.withGreen(105)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                )),
            title: Text(
              "Forecast",
              style: GoogleFonts.nunito(color: Colors.white, fontSize: 26),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leadingWidth: 50,
            titleSpacing: 5,
          ),
          body: FutureBuilder(
              future: getForecastInfo("rajkot"),
              builder: (context, snapshot) {
                // print(snapshot.data);
                if (snapshot.hasData) {
                  return Container(
                    child: Container(
                      child: Column(
                        children: [
                          Weathercard(
                            data: snapshot.data!["tomorrow"],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!['next5days'].length,
                              itemBuilder: (context, index) {
                                return Dayscard(
                                  data: snapshot.data!["next5days"][index],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                      child: LoadingAnimationWidget.inkDrop(
                          color: Colors.white, size: 50));
                }
              }),
        ),
      ),
    );
  }
}
