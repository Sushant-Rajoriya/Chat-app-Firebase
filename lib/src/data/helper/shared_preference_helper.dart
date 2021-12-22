import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USEREMAILKEY";
  static String sharedPreferenceUserImageUrlKey = "USERIMAGEURLKEY";

  //save data
  static Future<bool> saveUserLoggedInToSharedPreference(
      bool isUserLoggedIN) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        sharedPreferenceUserLoggedInKey, isUserLoggedIN);
  }

  static Future<bool> saveUserNameToSharedPreference(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserNameKey, userName);
  }

  static Future<bool> saveUserEmailToSharedPreference(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserEmailKey, email);
  }

  static Future<bool> saveUserImageUrlToSharedPreference(
      String imageUrl) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(
        sharedPreferenceUserImageUrlKey, imageUrl);
  }

  //Get Data

  static Future<bool> getUserLoggedInFromSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(sharedPreferenceUserLoggedInKey) ?? false;
  }

  static Future<String> getUserNameFromSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceUserNameKey) ?? '';
  }

  static Future<String> getUserEmailFromSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceUserEmailKey) ?? '';
  }

  static Future<String> getUserImageUrlFromSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceUserImageUrlKey) ?? '';
  }
}
