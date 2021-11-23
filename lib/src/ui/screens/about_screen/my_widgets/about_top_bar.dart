import 'package:chat_app_firebase/src/assets/app_font.dart';
import 'package:flutter/material.dart';

class AboutTopBar extends StatelessWidget {
  final String tittle;
  const AboutTopBar({Key? key, required this.tittle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Text(
          tittle,
          style: tittleTxt.copyWith(color: Colors.black, fontSize: 30),
        ),
        const Icon(
          Icons.edit,
          size: 25,
        ),
      ],
    );
  }
}
