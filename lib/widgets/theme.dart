import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
static ThemeData lightTheme(BuildContext context) => ThemeData(
   primarySwatch: Colors.amber,
          fontFamily: GoogleFonts.poppins().fontFamily,
          primaryTextTheme: GoogleFonts.latoTextTheme(),
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: Theme.of(context).textTheme,
          )
  
);


static ThemeData darkTheme(BuildContext context)=> ThemeData(
  brightness: Brightness.dark,
);
// Colors:-

static Color creamColor = Color.fromARGB(255, 255, 228, 228);
static Color darkBluishColor = Color.fromARGB(255, 17, 12, 43);



}