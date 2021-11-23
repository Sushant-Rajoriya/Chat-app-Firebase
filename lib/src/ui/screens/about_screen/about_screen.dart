import 'package:chat_app_firebase/src/ui/screens/about_screen/my_widgets/about_top_bar.dart';
import 'package:chat_app_firebase/src/ui/screens/about_screen/my_widgets/section.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AboutTopBar(tittle: "Rashmika"),
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
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://i2.wp.com/www.socialnews.xyz/wp-content/uploads/2020/02/22/Actress-Rashmika-Mandanna-Goofy-New-HD-Stills-14.jpg?resize=1708%2C2560&quality=90&zoom=1&ssl=1"),
                radius: 150,
              ),
            ),
            const Section(
              tittle: "Name :- ",
              data: "Rashmika Mandana",
            ),
            const Section(
              tittle: "Email :- ",
              data: "RashmikaMandana@gmail.com",
            ),
            const Section(
              tittle: "Phone :- ",
              data: "+91 835-796-7979",
            ),
            const Section(
              tittle: "Age   :- ",
              data: "25",
            ),
          ],
        ),
      ),
    );
  }
}
