import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseProvider extends ChangeNotifier {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
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
