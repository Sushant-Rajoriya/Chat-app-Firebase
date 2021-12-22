import 'package:bloc/bloc.dart';
import 'package:chat_app_firebase/src/data/model/login_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'load_contact_state.dart';

class LoadContactCubit extends Cubit<LoadContactState> {
  LoadContactCubit() : super(LoadContactState(users: []));

  Future<void> load() async {
    QuerySnapshot snap =
        await FirebaseFirestore.instance.collection('users').get();
    List<UserModel> users = [];
    for (var document in snap.docs) {
      users.add(UserModel(
          userName: document['name'],
          imageUrl: document['imageUrl'],
          email: document['email']));
    }

    emit(LoadContactState(users: users));
  }
}
