import 'package:chat_app_firebase/src/data/model/login_user.dart';
import 'package:chat_app_firebase/src/logic/cubit/chating/chating_cubit.dart';
import 'package:chat_app_firebase/src/logic/cubit/firebase_sign_in/firebase_sign_in_cubit.dart';
import 'package:chat_app_firebase/src/logic/cubit/load_contact/load_contact_cubit.dart';
import 'package:chat_app_firebase/src/logic/cubit/logged_in_user/loged_in_user_cubit.dart';
import 'package:chat_app_firebase/src/ui/screens/about_screen/about_screen.dart';
import 'package:chat_app_firebase/src/ui/screens/chat_screen/chat_screen.dart';
import 'package:chat_app_firebase/src/ui/screens/home_screen/home_screen.dart';
import 'package:chat_app_firebase/src/ui/screens/signin_screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static const signinScreen = "/";
  static const homeScreen = "/homeScreen";
  static const aboutScreen = "/aboutScreen";
  static const chatScreen = "/chatScreen";

  final FirebaseSignInCubit _firebaseSignInCubit = FirebaseSignInCubit();
  final LogedInUserCubit _logedInUserCubit = LogedInUserCubit();
  final LoadContactCubit _loadContactCubit = LoadContactCubit();
  final ChatingCubit _chatingCubit = ChatingCubit();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signinScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<FirebaseSignInCubit>(
                  create: (_) => _firebaseSignInCubit),
              BlocProvider<LogedInUserCubit>(create: (_) => _logedInUserCubit),
            ],
            child: const SigninScreen(),
          ),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<FirebaseSignInCubit>(
                  create: (_) => _firebaseSignInCubit),
              BlocProvider<LogedInUserCubit>(create: (_) => _logedInUserCubit),
              BlocProvider<LoadContactCubit>(create: (_) => _loadContactCubit),
              BlocProvider<ChatingCubit>(create: (_) => _chatingCubit),
            ],
            child: const HomeScreen(),
          ),
        );
      case aboutScreen:
        return MaterialPageRoute(
          builder: (context) => const AboutScreen(),
        );
      case chatScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<ChatingCubit>(
                create: (_) => _chatingCubit,
                child: ChatScreen(
                  chatModel:
                      ChatModel(currentUser: '', imageUrl: '', userName: ''),
                )));
      default:
        {
          throw ('This Page not Exist');
        }
    }
  }
}
