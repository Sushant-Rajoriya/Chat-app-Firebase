import 'package:chat_app_firebase/src/assets/app_font.dart';
import 'package:chat_app_firebase/src/assets/app_routes.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String tittle;
  final Function() logout;
  const TopBar({Key? key, required this.tittle, required this.logout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoute.aboutScreen);
          },
          child: const Icon(
            Icons.person,
            size: 25,
          ),
        ),
        Text(
          tittle,
          style: tittleTxt.copyWith(color: Colors.black, fontSize: 30),
        ),
        GestureDetector(
          onTap: logout(),
          child: const Icon(
            Icons.logout,
            size: 25,
          ),
        ),
      ],
    );
  }
}
