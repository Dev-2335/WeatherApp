import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dayscard extends StatefulWidget {
  const Dayscard({super.key});

  @override
  State<Dayscard> createState() => _DayscardState();
}

class _DayscardState extends State<Dayscard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: 380,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius:
            const BorderRadius.all(Radius.circular(25))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Expanded(child: Text("30 "+"Sept",style: GoogleFonts.nunito(fontSize: 15,color: Colors.white))),
                        ],
                      ),
                    )
                  ],
                ),flex: 2,),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: ClipRRect(
                              child: Image.asset("assets/images/img_2.png"),
                            ),
                            height: 40,
                          ),
                          SizedBox(width: 5,),
                          Expanded(child: Text("Thunderstrom",style: GoogleFonts.nunito(fontSize: 12,color: Colors.white))),
                        ],
                      )
                    ],
                  ),flex: 3),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: [
                          Text("+19"+"°",style: GoogleFonts.nunito(fontSize: 14,color: Colors.white)),
                          SizedBox(width: 15,),
                          Text("+15"+"°",style: GoogleFonts.nunito(fontSize: 14,color: Colors.white)),
                        ],
                      )
                    ],
                  ),flex: 2),




            ],
          ),
        ),
      ),
    );

  }
}
