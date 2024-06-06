import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/home.dart';

class SearchListCard extends StatelessWidget {
  String city;
  SearchListCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              city: city,
            ),
          ),
        ),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  city,
                  style: GoogleFonts.nunito(fontSize: 23, color: Colors.white),
                ),
                const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 23,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
