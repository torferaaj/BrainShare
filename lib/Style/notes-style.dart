import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesStyle{
  static Color bgColor = Color(0xffe2e2ff);
  static Color mainColor = Color(0xffbde3f8);
  static Color accentColor = Color(0xff0065ff);

  static List<Color> cardsColor = [
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.purple.shade100,
    Colors.blueGrey.shade100,
  ];

  static TextStyle mainTitle =
    GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
    GoogleFonts.nunito(fontSize: 16.0, fontWeight: FontWeight.normal);

  static TextStyle dateTitle =
    GoogleFonts.roboto(fontSize: 13.0, fontWeight: FontWeight.w500, color: Colors.black45);
}