import 'package:flutter/material.dart';

class FAppBarTheme {
  FAppBarTheme._();

  /// ---------- Light Theme -----------
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 24
    ),
    actionsIconTheme: IconThemeData(
        color: Colors.black,
        size: 24
    ),
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black
    )
  );

  /// ---------- Dark Theme -----------
  static const darkAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(
          color: Colors.white,
          size: 24
      ),
      actionsIconTheme: IconThemeData(
          color: Colors.white,
          size: 24
      ),
      titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white
      )
  );
}