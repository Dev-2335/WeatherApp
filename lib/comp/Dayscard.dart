import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dayscard extends StatefulWidget {
  var data;
  Dayscard({super.key,required this.data});

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
                          Expanded(child: Text(widget.data['date'],style: GoogleFonts.nunito(fontSize: 15,color: Colors.white))),
                        ],
                      ),
                    )
                  ],
                ),flex: 3,),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: ClipRRect(
                              child: Image.asset(widget.data['dayimg']),
                            ),
                            height: 40,
                          ),
                          SizedBox(width: 8,),
                          Expanded(child: Text(widget.data['condition'],style: GoogleFonts.nunito(fontSize: 14,color: Colors.white))),
                        ],
                      )
                    ],
                  ),flex: 5),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: [
                          Text(widget.data['maxTemp'].toString()+"°",style: GoogleFonts.nunito(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold)),
                          SizedBox(width: 15,),
                          Text(widget.data['minTemp'].toString()+"°",style: GoogleFonts.nunito(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),flex: 3),




            ],
          ),
        ),
      ),
    );

  }
}
