import 'package:chat_app_firebase/src/assets/app_font.dart';
import 'package:chat_app_firebase/src/ui/coman_widgets/message_widget.dart';
import 'package:chat_app_firebase/src/ui/screens/home_screen/home_widgets/top_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopBar(tittle: "CHAT +"),
                const SizedBox(height: 20),
                Text("Messages", style: textBlack20),
                const MessageWidget(
                  contactName: "Emeline",
                  massage:
                      " hi i want to talk to you plz msg me backhi i want to talk to you plz msg me backhi i want to talk to you plz msg me backhi i want to talk to you plz msg me backhi i want to talk to you plz msg me backhi i want to talk to you plz msg me backhi i want to talk to you plz msg me back",
                  time: "23 min",
                  numberOfUnReadMasseges: 5,
                  imageURl:
                      'https://img.odishatv.in/wp-content/uploads/2021/02/Rashmika-Mandanna-1.jpg',
                ),
                const MessageWidget(
                  contactName: "Emeline",
                  massage: "hi",
                  time: "23 min",
                  numberOfUnReadMasseges: 0,
                  imageURl:
                      'https://img.odishatv.in/wp-content/uploads/2021/02/Rashmika-Mandanna-1.jpg',
                ),
                const MessageWidget(
                  contactName: "Emeline",
                  massage: "hi i want to talk to you plz msg me back",
                  time: "23 min",
                  numberOfUnReadMasseges: 5,
                  imageURl:
                      'https://img.odishatv.in/wp-content/uploads/2021/02/Rashmika-Mandanna-1.jpg',
                ),
                const MessageWidget(
                  contactName: "Emeline",
                  massage: "hi i want to talk to you plz msg me back",
                  time: "23 min",
                  numberOfUnReadMasseges: 5,
                  imageURl:
                      'https://img.odishatv.in/wp-content/uploads/2021/02/Rashmika-Mandanna-1.jpg',
                ),
                const MessageWidget(
                  contactName: "Emeline",
                  massage: "hi i want to talk to you plz msg me back",
                  time: "23 min",
                  numberOfUnReadMasseges: 5,
                  imageURl:
                      'https://img.odishatv.in/wp-content/uploads/2021/02/Rashmika-Mandanna-1.jpg',
                ),
                const MessageWidget(
                  contactName: "Emeline",
                  massage:
                      "hi i want to talk to you plz msg me backhi i want to talk to you plz msg me backhi i want to talk to you plz msg me backhi i want to talk to you plz msg me back",
                  time: "23 min",
                  numberOfUnReadMasseges: 5,
                  imageURl:
                      'https://img.odishatv.in/wp-content/uploads/2021/02/Rashmika-Mandanna-1.jpg',
                ),
                const MessageWidget(
                  contactName: "Emeline",
                  massage: "hi i want to talk to you plz msg me back",
                  time: "23 min",
                  numberOfUnReadMasseges: 5,
                  imageURl:
                      'https://img.odishatv.in/wp-content/uploads/2021/02/Rashmika-Mandanna-1.jpg',
                ),
                const MessageWidget(
                  contactName: "Emeline",
                  massage: "hi i want to talk to you plz msg me back",
                  time: "23 min",
                  numberOfUnReadMasseges: 5,
                  imageURl:
                      'https://img.odishatv.in/wp-content/uploads/2021/02/Rashmika-Mandanna-1.jpg',
                ),
                const MessageWidget(
                  contactName: "Emeline",
                  massage:
                      "hi i want to talk to you hi i want to talk to you plz msg me backhi i want to talk to you plz msg me backhi i want to talk to you plz msg me backhi i want to talk to you plz msg me backplz msg me back",
                  time: "23 min",
                  numberOfUnReadMasseges: 5,
                  imageURl:
                      'https://img.odishatv.in/wp-content/uploads/2021/02/Rashmika-Mandanna-1.jpg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
