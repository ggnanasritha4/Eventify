import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(

    primaryColor: const Color(0xff1565C0), // Blue

    scaffoldBackgroundColor: const Color(0xffF5F7FB),


    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1565C0),
      foregroundColor: Colors.white,
      elevation: 3,
      centerTitle: true,

      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),


    textTheme: const TextTheme(

      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xff1565C0),
      ),

      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xff222222),
      ),

      bodyMedium: TextStyle(
        fontSize: 16,
        color: Color(0xff555555),
      ),
    ),



    cardTheme: CardThemeData(

      color: Colors.white,

      elevation: 5,

      margin: EdgeInsets.all(10),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),



    elevatedButtonTheme: ElevatedButtonThemeData(

      style: ElevatedButton.styleFrom(

        backgroundColor: const Color(0xffF57C00), // Orange

        foregroundColor: Colors.white,

        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 12,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),



    inputDecorationTheme: InputDecorationTheme(

      filled: true,

      fillColor: Colors.white,

      border: OutlineInputBorder(

        borderRadius: BorderRadius.circular(10),

      ),


      focusedBorder: OutlineInputBorder(

        borderRadius: BorderRadius.circular(10),

        borderSide: BorderSide(
          color: Color(0xffF57C00),
          width: 2,
        ),

      ),

    ),


    colorScheme: ColorScheme.fromSeed(

      seedColor: const Color(0xff1565C0),

      primary: const Color(0xff1565C0),

      secondary: const Color(0xffF57C00),

    ),
  );
}