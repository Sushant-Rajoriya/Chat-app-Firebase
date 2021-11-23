import 'package:chat_app_firebase/src/data/model/login_user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  LogInUser _logInUser = LogInUser(userName: '', imageUrl: '', email: '');

  bool _isUserLogIn = false;

  LogInUser get logInUser => _logInUser;

  bool get isUserLogIn => _isUserLogIn;

  Future addUserData(String name, String image, String emailAd) async {
    _logInUser.userName = name;
    _logInUser.imageUrl = image;
    _logInUser.email = emailAd;

    _isUserLogIn = true;

    notifyListeners();
  }

  Future removeUserData() async {
    _logInUser.userName = '';
    _logInUser.imageUrl = '';
    _logInUser.email = '';

    _isUserLogIn = false;

    notifyListeners();
  }
}
