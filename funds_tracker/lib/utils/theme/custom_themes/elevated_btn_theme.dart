import 'package:flutter/material.dart';

class FElevatedBtnTheme {
  FElevatedBtnTheme._();

  static final lightElevatedBtnTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF40A6DD),
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(
            color: Color(0xFF40A6DD)
        ),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        )
      )
  );



  // -------- Dark Theme ----------
  static final darkElevatedBtnTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF40A6DD),
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          //side: const BorderSide(
          //    color: Color(0xFF40A6DD)
          //),
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
          )
      )
  );
}