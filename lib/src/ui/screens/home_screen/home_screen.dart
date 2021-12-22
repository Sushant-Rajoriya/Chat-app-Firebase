import 'package:chat_app_firebase/src/assets/app_font.dart';
import 'package:chat_app_firebase/src/assets/app_routes.dart';
import 'package:chat_app_firebase/src/data/model/login_user.dart';
import 'package:chat_app_firebase/src/logic/cubit/firebase_sign_in/firebase_sign_in_cubit.dart';
import 'package:chat_app_firebase/src/logic/cubit/load_contact/load_contact_cubit.dart';
import 'package:chat_app_firebase/src/logic/cubit/logged_in_user/loged_in_user_cubit.dart';
import 'package:chat_app_firebase/src/ui/coman_widgets/contact_widget.dart';
import 'package:chat_app_firebase/src/ui/screens/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseSignInCubit _firebaseSignInCubit =
        BlocProvider.of<FirebaseSignInCubit>(context, listen: false);

    String _currentUser = '';
    LogedInUserCubit _logedInUserCubit =
        BlocProvider.of<LogedInUserCubit>(context, listen: false);

    LoadContactCubit _loadContactCubit =
        BlocProvider.of<LoadContactCubit>(context, listen: false);
    _loadContactCubit.load();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MultiBlocListener(listeners: [
                  BlocListener<LogedInUserCubit, LogedInUserState>(
                    listener: (context, state) {
                      _currentUser = state.logInUser.email;
                    },
                  ),
                ], child: const SizedBox.shrink()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoute.aboutScreen,
                        );
                      },
                      child: const Icon(
                        Icons.person,
                        size: 25,
                      ),
                    ),
                    Text(
                      "Chat +",
                      style:
                          tittleTxt.copyWith(color: Colors.black, fontSize: 30),
                    ),
                    GestureDetector(
                      onTap: () {
                        _firebaseSignInCubit.logout();
                        Navigator.of(context).pushNamed(AppRoute.signinScreen);
                      },
                      child: const Icon(
                        Icons.logout,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text("Messages", style: textBlack20),
                const SizedBox(
                  height: 20,
                ),
                Text("Contact", style: textBlack20),
                const SizedBox(
                  height: 12,
                ),
                BlocBuilder<LoadContactCubit, LoadContactState>(
                  builder: (context, state) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.users.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        //print(_currentUser);
                        String name = state.users[index].userName;
                        return GestureDetector(
                          onTap: () {
                            print(_currentUser);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                        chatModel: ChatModel(
                                      currentUser: _currentUser,
                                      userName: name,
                                      imageUrl:
                                          "https://www.clipartkey.com/mpngs/m/197-1979528_chat-room-apps-logo.png",
                                    ))));
                            /*
                            Navigator.of(context).pushNamed(AppRoute.chatScreen,
                                arguments: ChatModel(
                                    userName: state.users[index].userName,
                                    imageUrl: state.users[index].imageUrl,
                                    currentUser: _currentUser));
                          */
                          },
                          child: ContactWidget(
                            contactName: name,
                            imageURl: state.users[index].imageUrl,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
