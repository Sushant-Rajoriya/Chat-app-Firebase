import 'package:chat_app_firebase/src/assets/app_font.dart';
import 'package:chat_app_firebase/src/assets/app_routes.dart';
import 'package:flutter/material.dart';

class ChatTopBar extends StatelessWidget {
  final String tittle;
  final String url;
  const ChatTopBar({Key? key, required this.tittle, required this.url})
      : super(key: key);

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
          child: CircleAvatar(
            radius: 30,
            child: Image.network(url),
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
