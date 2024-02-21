import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:funds_tracker/common/components/navbar.dart';
import 'package:funds_tracker/features/requesteractions/screens/home.dart';
import 'package:funds_tracker/features/requesteractions/screens/request_screen.dart';
import 'package:funds_tracker/firebase_options.dart';
import 'package:get/get.dart';
import 'package:funds_tracker/features/authentication/screens/login/login.dart';
import 'package:funds_tracker/utils/theme/theme.dart';

import 'features/requesteractions/screens/view_request.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();

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
      //home: const LoginScreen(),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
