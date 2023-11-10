import 'package:flutter/material.dart';

class FBottomNavTheme {
  FBottomNavTheme._();

  static NavigationBarThemeData lightBottomNavBarTheme = const NavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 2,

  );

  static NavigationBarThemeData darkBottomNavBarTheme = const NavigationBarThemeData(
    backgroundColor: Colors.black12,
    indicatorColor: Colors.cyan,
    elevation: 2,

  );
}