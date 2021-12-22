import 'package:chat_app_firebase/src/data/model/login_user.dart';
import 'package:chat_app_firebase/src/ui/coman_widgets/my_text_field.dart';
import 'package:chat_app_firebase/src/ui/screens/chat_screen/my_widgets/chat_top_bar.dart';
import 'package:chat_app_firebase/src/ui/screens/chat_screen/my_widgets/chat_widget.dart';

import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final ChatModel chatModel;
  const ChatScreen({
    Key? key,
    required this.chatModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _chatController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ChatTopBar(
              tittle: chatModel.userName,
              url: chatModel.imageUrl,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.amber,
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    ChatWidget(
                      chatMessage:
                          "Messages is a simple, helpful messaging app that keeps you connected with the people who matter most. Text anyone from anywhere across devices. Messages. Skip to content. Messages for web Download Messages Simple, helpful messaging by Google. See how it works Chat features are globally available in the following countries* *Availability depends on your device and service provider. Boost your conversations with chat features Share high-quality media without extra fees, text on Wi-Fi,",
                      isMe: false,
                      time: '7:29 PM',
                    ),
                    ChatWidget(
                      chatMessage:
                          "Messages is a simple, helpful messaging app that keeps you connected with the people who matter most. Text anyone from anywhere across devices. Messages. Skip to content. Messages for web Download Messages Simple, helpful messaging by Google. See how it works Chat features are globally available in the following countries* *Availability depends on your device and service provider. Boost your conversations with chat features Share high-quality media without extra fees, text on Wi-Fi,",
                      isMe: true,
                      time: '10:21 AM',
                    ),
                  ],
                ),
              ),
            ),
          ),
          MyTextField(
            labelText: "Type here....",
            keyboardType: TextInputType.multiline,
            isPassword: false,
            controller: _chatController,
            icon: const Icon(Icons.emoji_emotions),
          ),
        ],
      ),
    );
  }
}
