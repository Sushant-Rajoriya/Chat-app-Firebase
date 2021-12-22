import 'package:bloc/bloc.dart';
import 'package:chat_app_firebase/src/data/fireStore_methods/fire_store_data_methods.dart';
import 'package:chat_app_firebase/src/data/helper/shared_preference_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'firebase_sign_in_state.dart';

class FirebaseSignInCubit extends Cubit<FirebaseSignInState> {
  FirebaseSignInCubit() : super(FirebaseSignInState(isUserLogin: false));

  Future<void> signInWith(String auth) async {
    switch (auth) {
      case 'Google':
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        storeUserInfo(
            googleUser!.displayName, googleUser.photoUrl, googleUser.email);

        break;

      case 'Phone':
        //Todo 1 :- Add Number of User to name
        storeUserInfo(
            "",
            "https://cdn2.iconfinder.com/data/icons/business-roundline/512/mobile_phone-512.png",
            _mobileNumber);

        break;

      default:
        {
          throw ('Can not Login');
        }
    }
  }

  Future storeUserInfo(String? name, String? image, String? emailAd) async {
    FireStoreDataMethods fireStoreDataMethods = FireStoreDataMethods();
    Map<String, String> userInfoMap = {
      "name": name ?? "",
      "email": emailAd ?? "",
      "imageUrl": image ?? ""
    };

    fireStoreDataMethods.uploadUserInfor(userInfoMap, emailAd);

    SharedPreferenceHelper.saveUserLoggedInToSharedPreference(true);
    SharedPreferenceHelper.saveUserNameToSharedPreference(name ?? "");
    SharedPreferenceHelper.saveUserEmailToSharedPreference(emailAd ?? "");
    SharedPreferenceHelper.saveUserImageUrlToSharedPreference(image ?? "");

    emit(FirebaseSignInState(isUserLogin: true));
  }

  String _verificationID = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _mobileNumber = '';
  Future otpLogin(String number) async {
    _mobileNumber = number;
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
        signInWith("Phone");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    await _auth.signOut();
     SharedPreferenceHelper.saveUserLoggedInToSharedPreference(false);
    SharedPreferenceHelper.saveUserNameToSharedPreference("");
    SharedPreferenceHelper.saveUserEmailToSharedPreference("");
    SharedPreferenceHelper.saveUserImageUrlToSharedPreference("");
  }
}
