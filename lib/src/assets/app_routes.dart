import 'package:chat_app_firebase/src/data/helper/shared_preference_helper.dart';
import 'package:chat_app_firebase/src/logic/cubit/firebase_sign_in/firebase_sign_in_cubit.dart';
import 'package:chat_app_firebase/src/logic/provider/firebase_provider.dart';
import 'package:chat_app_firebase/src/logic/provider/user_provider.dart';
import 'package:chat_app_firebase/src/ui/screens/about_screen/about_screen.dart';
import 'package:chat_app_firebase/src/ui/screens/chat_screen/chat_screen.dart';
import 'package:chat_app_firebase/src/ui/screens/home_screen/home_screen.dart';
import 'package:chat_app_firebase/src/ui/screens/signin_screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AppRoute {
  static const signinScreen = "/";
  static const homeScreen = "/homeScreen";
  static const aboutScreen = "/aboutScreen";
  static const chatScreen = "/chatScreen";

  final FirebaseSignInCubit _firebaseSignInCubit = FirebaseSignInCubit();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signinScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<FirebaseSignInCubit>(
                  create: (_) => _firebaseSignInCubit),
            ],
            child: const SigninScreen(),
          ),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case aboutScreen:
        return MaterialPageRoute(
          builder: (context) => const AboutScreen(),
        );
      case chatScreen:
        return MaterialPageRoute(
          builder: (context) => const ChatScreen(),
        );
      default:
        {
          throw ('This Page not Exist');
        }
    }
  }
}
