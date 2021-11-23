import 'package:chat_app_firebase/src/assets/app_font.dart';
import 'package:chat_app_firebase/src/ui/coman_widgets/box_look.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String tittle;
  final String data;

  const Section({
    Key? key,
    required this.tittle,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoxLook(
      myChild: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              tittle,
              style: tittleTxt.copyWith(fontSize: 22),
            ),
            SizedBox(
              width: 220,
              child: Text(
                data,
                style: tittleTxt.copyWith(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
