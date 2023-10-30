import 'package:flutter/material.dart';

void main(){
  runApp(const Splash());
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Image.asset("./images/bc.png")
          ),
        ),
      );
  }
}


