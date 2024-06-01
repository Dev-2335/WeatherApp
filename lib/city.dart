import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/comp/city_card.dart';

class City extends StatefulWidget {
  const City({super.key});

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blue.shade400, Colors.blue.withGreen(105)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: Icon(CupertinoIcons.back,color: Colors.white,),
            title: Text("City",style: GoogleFonts.nunito(color: Colors.white),),
            backgroundColor: Colors.transparent,
            leadingWidth: 50,
            titleSpacing: 5,
          ),
          body: Container(
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10,top: 5),
                    child: CupertinoSearchTextField(
                      style: TextStyle(color: Colors.white),
                      itemColor: Colors.white,
                      placeholderStyle: TextStyle(color: Colors.white,),
                      backgroundColor: Color.fromRGBO(255, 255, 255, 190),
                    )
                  ),
                  SizedBox(height: 5,),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return CityCard();
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
