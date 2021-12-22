import 'package:chat_app_firebase/src/assets/app_font.dart';
import 'package:chat_app_firebase/src/assets/app_routes.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  final String imageURl;
  final String contactName;
  const ContactWidget({
    Key? key,
    required this.imageURl,
    required this.contactName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoute.chatScreen);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageURl),
              radius: 40,
              backgroundColor: Colors.white12,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              contactName,
              style: textBlack20,
            ),
          ],
        ),
      ),
    );
  }
}
