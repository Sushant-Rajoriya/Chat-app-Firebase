import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  final Widget? myChild;
  final bool isMe;
  const ChatBox({Key? key, required this.myChild, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          margin: const EdgeInsets.all(4.0), //Same as `blurRadius` i guess
          decoration: BoxDecoration(
            borderRadius: isMe
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  )
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),

          child: myChild,
        ),
      ),
    );
  }
}
