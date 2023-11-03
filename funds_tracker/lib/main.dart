import 'package:flutter/material.dart';
import 'package:funds_tracker/screens/requester/home.dart';
import 'package:funds_tracker/utils/theme/theme.dart';
import './screens/requester/request.dart';
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
      themeMode: ThemeMode.system,
      theme: FAppTheme.lightTheme,
      darkTheme: FAppTheme.darkTheme,
      title: 'Funds Tracker',
      //home: Splash(),
      home: const Home(),
      routes: {
        "/history" :(context) => const History(),
        "/profile" :(context) => const Profile(),
        "/request" :(context) => const Request(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


