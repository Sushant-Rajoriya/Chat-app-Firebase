import 'package:chat_app_firebase/src/data/helper/shared_preference_helper.dart';
import 'package:chat_app_firebase/src/data/model/login_user.dart';
import 'package:chat_app_firebase/src/ui/screens/about_screen/my_widgets/about_top_bar.dart';
import 'package:chat_app_firebase/src/ui/screens/about_screen/my_widgets/section.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  static UserModel userModel = UserModel(
      userName: "Loading..",
      imageUrl:
          "https://www.clipartkey.com/mpngs/m/197-1979528_chat-room-apps-logo.png",
      email: "Loading..");
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AboutTopBar(tittle: userModel.userName),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 8, color: Colors.black12, spreadRadius: 8)
                ],
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(userModel.imageUrl),
                radius: 150,
              ),
            ),
            Section(
              tittle: "Name :- ",
              data: userModel.userName,
            ),
            Section(
              tittle: "Email :- ",
              data: userModel.email,
            ),
            const Section(
              tittle: "Phone :- ",
              data: "+91 835-796-7979",
            ),
          ],
        ),
      ),
    );
  }

  getUserInfo() async {
    String email =
        await SharedPreferenceHelper.getUserEmailFromSharedPreference();
    String name =
        await SharedPreferenceHelper.getUserNameFromSharedPreference();
    String image =
        await SharedPreferenceHelper.getUserImageUrlFromSharedPreference();
    userModel.email = email;
    userModel.userName = name;
    userModel.imageUrl = image;
  }
}
