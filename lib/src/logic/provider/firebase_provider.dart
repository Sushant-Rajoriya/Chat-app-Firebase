import 'package:chat_app_firebase/src/data/fireStore_methods/fire_store_data_methods.dart';
import 'package:chat_app_firebase/src/data/model/login_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseProvider extends ChangeNotifier {
  LogInUser _logInUser =
      LogInUser(userName: '', imageUrl: '', email: '', isUserLogin: false);

  bool _isUserLogIn = false;

  LogInUser get logInUser => _logInUser;

  bool get isUserLogIn => _isUserLogIn;

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    FireStoreDataMethods fireStoreDataMethods = FireStoreDataMethods();
    await addUserData(
        googleUser!.displayName, googleUser.photoUrl, googleUser.email);
  }

  Future addUserData(String? name, String? image, String? emailAd) async {
    _logInUser.userName = name ?? '';
    _logInUser.imageUrl = image ?? '';
    _logInUser.email = emailAd ?? '';

    FireStoreDataMethods fireStoreDataMethods = FireStoreDataMethods();
    Map<String, String> userInfoMap = {
      "name": name ?? "",
      "email": emailAd ?? "",
      "imageUrl": image ?? ""
    };
    fireStoreDataMethods.uploadUserInfor(userInfoMap);
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

/*
  Future facebookLogin() async {
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      final facbookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);

      await FirebaseAuth.instance.signInWithCredential(facbookAuthCredential);

      print(userData['email']);
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  bool _isPhonOTP = false;
  bool get isPhonOTP => _isPhonOTP;
  changePhoneStatusToTrue() async {
    _isPhonOTP = true;
    notifyListeners();
  }

  changePhonStatusToFalse() async {
    _isPhonOTP = false;
    notifyListeners();
  }

  String _verificationID = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future otpLogin(String number) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: "+91 $number",
        verificationCompleted: (phoneAuthCredential) async {},
        verificationFailed: (verificationFailed) async {
          print(verificationFailed.message);
        },
        codeSent: (verificationId, resendingToken) async {
          _verificationID = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) async {});
  }

  Future verifyOTP(String smsCode) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: _verificationID, smsCode: smsCode);
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user != null) {
        print("Hogya bhai");
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future logout() async {
    // await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    await _auth.signOut();
  }
  */
}
