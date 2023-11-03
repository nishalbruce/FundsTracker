import 'package:flutter/material.dart';

class FRadioBtnTheme {
  FRadioBtnTheme._();

  // --------- Light Theme -----------
  static RadioThemeData lightRadioBtnTheme = RadioThemeData(
    fillColor: MaterialStateColor.resolveWith((states){
      if(states.contains(MaterialState.selected)){
        return const Color(0xFF40A6DD);
      }else{
        return Colors.transparent;
      }
    })
  );

  // --------- Dark Theme -----------
  static RadioThemeData darkRadioBtnTheme = RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states){
        if(states.contains(MaterialState.selected)){
          return const Color(0xFF40A6DD);
        }else{
          return Colors.transparent;
        }
      })
  );
}