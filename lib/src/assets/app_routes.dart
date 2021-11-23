import 'package:chat_app_firebase/src/logic/provider/firebase_provider.dart';
import 'package:chat_app_firebase/src/logic/provider/user_provider.dart';
import 'package:chat_app_firebase/src/ui/screens/about_screen/about_screen.dart';
import 'package:chat_app_firebase/src/ui/screens/chat_screen/chat_screen.dart';
import 'package:chat_app_firebase/src/ui/screens/home_screen/home_screen.dart';
import 'package:chat_app_firebase/src/ui/screens/signin_screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRoute {
  static const signinScreen = "/";
  static const homeScreen = "/homeScreen";
  static const aboutScreen = "/aboutScreen";
  static const chatScreen = "/chatScreen";

  final FirebaseProvider _firebaseProvider = FirebaseProvider();
  final UserProvider _userProvider = UserProvider();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signinScreen:
        return MaterialPageRoute(
          builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (BuildContext context) => _firebaseProvider),
              ChangeNotifierProvider(
                  create: (BuildContext context) => _userProvider)
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
