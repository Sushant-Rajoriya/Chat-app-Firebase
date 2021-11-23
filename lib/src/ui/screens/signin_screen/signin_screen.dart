import 'package:chat_app_firebase/src/assets/app_colors.dart';
import 'package:chat_app_firebase/src/assets/app_font.dart';
import 'package:chat_app_firebase/src/assets/app_routes.dart';
import 'package:chat_app_firebase/src/logic/provider/firebase_provider.dart';
import 'package:chat_app_firebase/src/logic/provider/user_provider.dart';
import 'package:chat_app_firebase/src/ui/coman_widgets/box_look.dart';
import 'package:chat_app_firebase/src/ui/coman_widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late TextEditingController _usernameController = TextEditingController();

    late TextEditingController _passwordController = TextEditingController();

    FirebaseProvider _firebaseProvider = Provider.of<FirebaseProvider>(context);

    UserProvider _userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: primaryColor,
      body: BoxLook(
        myChild: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text("Welcome To",
                  style:
                      textBlack20.copyWith(color: Colors.black, fontSize: 28)),
              Text("CHAT +", style: tittleTxt.copyWith(fontSize: 45)),
              Text(
                  "Please enter your Email & Password in the Boxes below to get started:",
                  style: textBlack20.copyWith(
                      color: Colors.black38, fontSize: 18)),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                icon: const Icon(Icons.people),
                labelText: "Email or Phone Number",
                keyboardType: TextInputType.text,
                isPassword: false,
                controller: _usernameController,
              ),
              MyTextField(
                icon: const Icon(Icons.security),
                labelText: "Password",
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: _passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoute.homeScreen);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      height: 55,
                      color: Colors.deepPurpleAccent,
                      child: Center(
                          child: Text(
                        "Continue",
                        style: textBlack20.copyWith(color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text("----------- or Sign in with ----------",
                  style: textBlack20.copyWith(
                      color: Colors.black38, fontSize: 18)),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                  GestureDetector(
                    onTap: () {
                      print(_firebaseProvider.signInWithGoogle());
                    },
                    child: CircleAvatar(
                      radius: 30,
                      child: Image.network(
                          'https://letsgyl.com/wp-content/uploads/2018/02/Google-Logo-uplabs.com_.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _firebaseProvider.signInWithGoogle();
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
}
