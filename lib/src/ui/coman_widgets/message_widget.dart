import 'package:chat_app_firebase/src/assets/app_font.dart';
import 'package:chat_app_firebase/src/assets/app_routes.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String imageURl;
  final String contactName;
  final String massage;
  final String time;
  final int numberOfUnReadMasseges;
  const MessageWidget({
    Key? key,
    required this.imageURl,
    required this.contactName,
    required this.massage,
    required this.time,
    required this.numberOfUnReadMasseges,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool haveUnread = false;
    if (numberOfUnReadMasseges > 0) {
      haveUnread = true;
    }
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoute.chatScreen);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageURl),
              radius: 40,
              backgroundColor: Colors.white12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  contactName,
                  style: textBlack20,
                ),
                SizedBox(
                    width: 250,
                    child: Text(
                      trim(massage),
                      style: textBlack20.copyWith(fontSize: 15),
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(time),
                const SizedBox(
                  height: 15,
                ),
                CircleAvatar(
                  child: haveUnread
                      ? Text(
                          numberOfUnReadMasseges.toString(),
                          style: textBlack20.copyWith(
                              color: Colors.white, fontSize: 15),
                        )
                      : const SizedBox.shrink(),
                  backgroundColor:
                      haveUnread ? Colors.green : Colors.transparent,
                  radius: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String trim(String message) {
    if (massage.length >= 70) {
      return message.substring(0, 70) + "...";
    }
    return message;
  }
}
