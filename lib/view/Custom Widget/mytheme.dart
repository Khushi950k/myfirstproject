import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class MyTheme {

  static ThemeData lightTheme(BuildContext context) => ThemeData(
    canvasColor: Colors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
       primary: Colors.black87,
        onPrimary: Colors.black87, 
        secondary: Colors.black87,
         onSecondary:Colors.black54 , 
         error: Colors.red,
          onError: Colors.red,
           background: Colors.cyan.shade100, 
           onBackground: Colors.black,
            surface: Colors.cyan.shade50, 
            onSurface: Colors.black)
  );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
    canvasColor: Colors.black,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
       primary: Colors.white,
        onPrimary: Colors.white, 
        secondary: Colors.white,
         onSecondary:Colors.white , 
         error: Colors.red,
          onError: Colors.red,
           background: Colors.cyan.shade100, 
           onBackground: Colors.black,
            surface: Colors.cyan.shade50, 
            onSurface: Colors.black)
  );
}

