import 'package:bloc/bloc.dart';
import 'package:chat_app_firebase/src/data/helper/shared_preference_helper.dart';
import 'package:chat_app_firebase/src/data/model/login_user.dart';

part 'loged_in_user_state.dart';

class LogedInUserCubit extends Cubit<LogedInUserState> {
  LogedInUserCubit()
      : super(LogedInUserState(
            logInUser: LogInUser(
          email: '',
          imageUrl: '',
          userName: '',
          isUserLogin: false,
        )));

  Future checkUserLoggedIn() async {
    bool isLogin =
        await SharedPreferenceHelper.getUserLoggedInFromSharedPreference();

    if (isLogin) {
      String email =
          await SharedPreferenceHelper.getUserEmailFromSharedPreference();
      String name =
          await SharedPreferenceHelper.getUserNameFromSharedPreference();
      String image =
          await SharedPreferenceHelper.getUserImageUrlFromSharedPreference();
      emit(LogedInUserState(
          logInUser: LogInUser(
        email: email,
        imageUrl: image,
        userName: name,
        isUserLogin: isLogin,
      )));
    }
  }
}
