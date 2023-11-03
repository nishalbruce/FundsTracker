import 'package:flutter/material.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/elevated_btn_theme.dart';
import 'custom_themes/input_theme.dart';
import 'custom_themes/radio_btn_theme.dart';
import 'custom_themes/text_theme.dart';

class FAppTheme {
  FAppTheme._();

  static ThemeData lightTheme = ThemeData(
    appBarTheme: FAppBarTheme.lightAppBarTheme,
    fontFamily: "Lexend",
    brightness: Brightness.light,
    primaryColor: const Color(0xFF40A6DD),
    scaffoldBackgroundColor: Colors.white,
    textTheme: FTextTheme.lightTextTheme,
    elevatedButtonTheme: FElevatedBtnTheme.lightElevatedBtnTheme,
    radioTheme: FRadioBtnTheme.lightRadioBtnTheme,
    inputDecorationTheme: FInputDecorationTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: FAppBarTheme.darkAppBarTheme,
    fontFamily: "Lexend",
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF40A6DD),
    scaffoldBackgroundColor: Colors.black54,
    textTheme: FTextTheme.darkTextTheme,
    elevatedButtonTheme: FElevatedBtnTheme.darkElevatedBtnTheme,
    radioTheme: FRadioBtnTheme.darkRadioBtnTheme,
    inputDecorationTheme: FInputDecorationTheme.darkInputDecorationTheme,
  );
}