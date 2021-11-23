import 'package:chat_app_firebase/src/ui/coman_widgets/box_look.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BoxLook(myChild: Text("Messages"));
  }
}
