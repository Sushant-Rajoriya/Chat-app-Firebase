import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDataMethods {
  getAllUsers() async {
    return await FirebaseFirestore.instance.collection('users').get();
  }

  uploadUserInfor(userMap, email) async {
    final snapShot = await FirebaseFirestore.instance
        .collection('users')
        .doc(email) // varuId in your case
        .get();

    if (snapShot == null || !snapShot.exists) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(email)
          .set(userMap)
          .catchError((e) {
        print(e.toString());
      });
    }
  }

  createChatRoom(String chatRoomId, chatRoomMap) {
    FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .set(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
