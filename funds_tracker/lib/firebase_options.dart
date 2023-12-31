// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCf7VOJ0BgKrOfa6ir0n3kTaiSLlEvnunE',
    appId: '1:581466079756:web:7aab2518017e92202c2429',
    messagingSenderId: '581466079756',
    projectId: 'funds-tracker-aclis',
    authDomain: 'funds-tracker-aclis.firebaseapp.com',
    storageBucket: 'funds-tracker-aclis.appspot.com',
    measurementId: 'G-HEZLC4JG15',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrP9lsHooD6036h2_tnHr6nUK5g0IFcjE',
    appId: '1:581466079756:android:713d355e6fda0f2b2c2429',
    messagingSenderId: '581466079756',
    projectId: 'funds-tracker-aclis',
    storageBucket: 'funds-tracker-aclis.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDKvWLylUaLMUOEoo6UWge3EYeOLrIkH4',
    appId: '1:581466079756:ios:bc3b839f2c01f3502c2429',
    messagingSenderId: '581466079756',
    projectId: 'funds-tracker-aclis',
    storageBucket: 'funds-tracker-aclis.appspot.com',
    iosBundleId: 'com.example.fundsTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBDKvWLylUaLMUOEoo6UWge3EYeOLrIkH4',
    appId: '1:581466079756:ios:0b80cddf309c34022c2429',
    messagingSenderId: '581466079756',
    projectId: 'funds-tracker-aclis',
    storageBucket: 'funds-tracker-aclis.appspot.com',
    iosBundleId: 'com.example.fundsTracker.RunnerTests',
  );
}
