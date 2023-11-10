import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:funds_tracker/features/authentication/screens/login/login.dart';
import 'package:funds_tracker/utils/theme/theme.dart';


void main() {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: FAppTheme.lightTheme,
      darkTheme: FAppTheme.darkTheme,
      title: 'Funds Tracker',
      //home: Splash(),
      home: const LoginScreen(),
      //routes: {
      //  "/history" :(context) => const History(),
      //  "/profile" :(context) => const Profile(),
      //  "/request" :(context) => const Request(),
      //  "/home" :(context) => const Home(),
      //  "/nav" :(context) => const NavigBar(),
      //},
      debugShowCheckedModeBanner: false,
    );
  }
}


