import 'package:chat_app_firebase/src/assets/app_font.dart';
import 'package:chat_app_firebase/src/assets/app_routes.dart';
import 'package:flutter/material.dart';

class ChatTopBar extends StatelessWidget {
  final String tittle;
  const ChatTopBar({Key? key, required this.tittle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoute.aboutScreen);
          },
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://i2.wp.com/www.socialnews.xyz/wp-content/uploads/2020/02/22/Actress-Rashmika-Mandanna-Goofy-New-HD-Stills-14.jpg?resize=1708%2C2560&quality=90&zoom=1&ssl=1"),
            radius: 25,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          tittle,
          style: tittleTxt.copyWith(color: Colors.black, fontSize: 25),
        ),
      ],
    );
  }
}
