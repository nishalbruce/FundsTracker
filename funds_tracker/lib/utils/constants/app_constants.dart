import 'package:shared_preferences/shared_preferences.dart';

class AppConstants{
  static SharedPreferences? sharedPreferences;

  static const userID = "userID";
  static const email = "userEmail";
  static const pswd = "userPassword";
  static const role = "userRole";
  static const username = "userName";
}