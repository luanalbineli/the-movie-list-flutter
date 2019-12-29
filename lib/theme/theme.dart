import 'package:flutter/material.dart';

class AppTheme {
  static getTheme(BuildContext context) {
    return ThemeData(
      accentColor: Colors.white,
      primaryColor: Colors.white,
      hintColor: Colors.white,
      textTheme: Theme.of(context)
        .textTheme
        .apply(bodyColor: Colors.white, displayColor: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white))
      )
    );
  }
}