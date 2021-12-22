import 'package:bloc/bloc.dart';

part 'chating_state.dart';

class ChatingCubit extends Cubit<ChatingState> {
  ChatingCubit()
      : super(ChatingState(userName: "", userUrl: "", currentUser: ""));

  openChat(String name, String url, String currentUser) {
    emit(ChatingState(userName: name, userUrl: url, currentUser: currentUser));
  }
}
