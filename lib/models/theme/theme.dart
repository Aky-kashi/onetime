import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final ThemeData lightThemeData = ThemeData.dark().copyWith(
  highlightColor: Colors.grey[200],
  splashColor: Colors.grey[200],
  primaryColor: Colors.blue,
  accentColor: Colors.blue,
  brightness: Brightness.light,
  backgroundColor: Color(0xFFE5E5E5),
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  textTheme: ThemeData.light().textTheme.copyWith(
        bodyText1: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        bodyText2: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        headline6: TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
);

final ThemeData darkThemeData = ThemeData.dark().copyWith(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: Color(0xFF000000),
  accentColor: Colors.blue,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black54,
  textTheme: ThemeData.light().textTheme.copyWith(
        bodyText1: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        bodyText2: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        headline6: TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
);
