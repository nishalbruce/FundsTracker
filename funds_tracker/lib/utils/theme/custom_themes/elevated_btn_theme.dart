import 'package:flutter/material.dart';

class FElevatedBtnTheme {
  FElevatedBtnTheme._();

  static final lightElevatedBtnTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: const Size.fromHeight(40),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF40A6DD),
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(
            color: Color(0xFF40A6DD)
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontFamily: "Lexend",
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
        ),
      ),
  );



  // -------- Dark Theme ----------
  static final darkElevatedBtnTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          fixedSize: const Size.fromHeight(40),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF40A6DD),
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          textStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Lexend",
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
          ),
      ),
  );
}