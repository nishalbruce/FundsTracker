import 'package:flutter/material.dart';
import './screens/approver/dashboard.dart';
import './screens/requester/profile.dart';
import './screens/requester/history.dart';
//import 'components/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funds Tracker',
      //home: Splash(),
      home: const Dashboard(),
      routes: {
        "/history" :(context) => const History(),
        "/profile" :(context) => const Profile(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


