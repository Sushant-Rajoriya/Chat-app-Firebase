import 'package:chat_app_firebase/src/assets/app_font.dart';
import 'package:chat_app_firebase/src/ui/screens/chat_screen/my_widgets/chat_box.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final String chatMessage;
  final bool isMe;
  final String time;
  const ChatWidget(
      {Key? key,
      required this.chatMessage,
      required this.isMe,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          ChatBox(
            myChild: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      chatMessage,
                      style: tittleTxt.copyWith(fontSize: 18),
                    ),
                    Text(
                      time,
                      style: tittleTxt.copyWith(
                          fontSize: 15, color: Colors.black38),
                    ),
                  ],
                ),
              ),
            ),
            isMe: isMe,
          ),
        ],
      ),
    );
  }
}
