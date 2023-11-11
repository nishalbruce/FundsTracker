import 'package:flutter/material.dart';

class FBottomNavTheme {
  FBottomNavTheme._();

  static NavigationBarThemeData lightBottomNavBarTheme = const NavigationBarThemeData(
    backgroundColor: Color(0xFF40A6DD),
    elevation: 2,

  );

  static NavigationBarThemeData darkBottomNavBarTheme = const NavigationBarThemeData(
    backgroundColor: Colors.black12,
    indicatorColor: Colors.red,
    elevation: 2,

  );
}