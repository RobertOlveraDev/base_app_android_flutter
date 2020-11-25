import 'package:flutter/material.dart';

getAppTheme() => ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      // rosa
      primaryColor: Color(0xFFF06292),
      primaryColorLight: Color(0xFFff94c2),
      primaryColorDark: Color(0xFFba2d65),

      // azul
      accentColor: Color(0xFF81d4fa),

      // Define the default font family.
      fontFamily: 'Georgia',

      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFFddcba4),
      ),

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    );

getLoginTheme() => ThemeData(
      //dorado
      accentColor: Color(0xFFddcba4),
      brightness: Brightness.dark,
    );
