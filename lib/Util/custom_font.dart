import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomFont {
  // Roboto Font
  static TextStyle getRobotoStyle(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Roboto Font
  static TextStyle getRobotoNavbarStyle() {
    return GoogleFonts.roboto(
      fontSize: 10,
      fontWeight: FontWeight.w400,
    );
  }
}
