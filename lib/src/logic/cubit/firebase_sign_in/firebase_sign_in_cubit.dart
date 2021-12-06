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
    var abs = fireStoreDataMethods.getUsersByUserEmail(emailAd ?? '');
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(abs);
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    fireStoreDataMethods.uploadUserInfor(userInfoMap);

    SharedPreferenceHelper.saveUserLoggedInToSharedPreference(true);
    SharedPreferenceHelper.saveUserNameToSharedPreference(name ?? "");
    SharedPreferenceHelper.saveUserEmailToSharedPreference(emailAd ?? "");
    SharedPreferenceHelper.saveUserImageUrlToSharedPreference(image ?? "");

    emit(FirebaseSignInState(isUserLogin: true));
  }
}
