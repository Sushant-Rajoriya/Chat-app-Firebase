import 'package:chat_app_firebase/src/assets/app_colors.dart';
import 'package:chat_app_firebase/src/assets/app_font.dart';
import 'package:chat_app_firebase/src/assets/app_routes.dart';
import 'package:chat_app_firebase/src/logic/cubit/firebase_sign_in/firebase_sign_in_cubit.dart';
import 'package:chat_app_firebase/src/logic/cubit/logged_in_user/loged_in_user_cubit.dart';
import 'package:chat_app_firebase/src/ui/coman_widgets/box_look.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _editingController = TextEditingController();
  bool otpSend = false;

  FirebaseSignInCubit _firebaseSignInCubit = FirebaseSignInCubit();

  @override
  Widget build(BuildContext context) {
    _firebaseSignInCubit =
        BlocProvider.of<FirebaseSignInCubit>(context, listen: false);

    LogedInUserCubit _logedInUserCubit =
        BlocProvider.of<LogedInUserCubit>(context, listen: false);
    _logedInUserCubit.checkUserLoggedIn();

    return Scaffold(
      backgroundColor: primaryColor,
      body: BoxLook(
        myChild: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MultiBlocListener(listeners: [
                BlocListener<LogedInUserCubit, LogedInUserState>(
                  listener: (context, state) {
                    if (state.logInUser.isUserLogin) {
                      Navigator.of(context).pushNamed(AppRoute.homeScreen);
                    }
                  },
                ),
                BlocListener<FirebaseSignInCubit, FirebaseSignInState>(
                  listener: (context, state) {
                    if (state.isUserLogin) {
                      Navigator.of(context).pushNamed(AppRoute.homeScreen);
                    }
                  },
                ),
              ], child: const SizedBox.shrink()),
              SizedBox(
                width: 200,
                child: Image.network(
                    'https://www.clipartkey.com/mpngs/m/197-1979528_chat-room-apps-logo.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Welcome To",
                  style:
                      textBlack20.copyWith(color: Colors.black, fontSize: 28)),
              Text("CHAT +", style: tittleTxt.copyWith(fontSize: 45)),
              const SizedBox(
                height: 20,
              ),
              Text(
                  "This is a Chat app That helps you to Communicate with your Friends & Family, So Let's get started:",
                  style: textBlack20.copyWith(
                      color: Colors.black38, fontSize: 18)),
              const SizedBox(
                height: 30,
              ),
              Text("----------- Sign in with ----------",
                  style: textBlack20.copyWith(
                      color: Colors.black38, fontSize: 18)),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /*
                  GestureDetector(
                    onTap: () {
                      //_firebaseProvider.googleLogin();
                    },
                    child: CircleAvatar(
                      radius: 30,
                      child: Image.network(
                          'https://icons-for-free.com/iconfiles/png/512/facebook+icon-1320193917989505812.png'),
                    ),
                  ),

                  */
                  GestureDetector(
                    onTap: () {
                      _firebaseSignInCubit.signInWith('Google');
                    },
                    child: CircleAvatar(
                      radius: 30,
                      child: Image.network(
                          'https://letsgyl.com/wp-content/uploads/2018/02/Google-Logo-uplabs.com_.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //_firebaseSignInCubit.signInWith('Phone');
                      if (otpSend) {
                        _displayDialog(context, 'Enter OTP for Verification',
                            "Verify OTP");
                      } else {
                        _displayDialog(
                            context, 'What is your Mobile Number', "Send OTP");
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Image.network(
                          'https://cdn2.iconfinder.com/data/icons/business-roundline/512/mobile_phone-512.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _displayDialog(BuildContext context, String title, String buttonTitle) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: TextField(
              controller: _editingController,
              textInputAction: TextInputAction.go,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(hintText: "Enter"),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(buttonTitle),
                onPressed: () {
                  if (otpSend) {
                    _firebaseSignInCubit.verifyOTP(_editingController.text);
                    otpSend = false;
                    _editingController.clear();
                    Navigator.of(context).pop();
                  } else {
                    _firebaseSignInCubit.otpLogin(_editingController.text);
                    otpSend = true;
                    _editingController.clear();
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          );
        });
  }
}
