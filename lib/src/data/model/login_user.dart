class LogInUser {
  String userName;
  String imageUrl;
  String email;
  bool isUserLogin;

  LogInUser({
    required this.userName,
    required this.imageUrl,
    required this.email,
    required this.isUserLogin,
  });
}

class UserModel {
  String userName;
  String imageUrl;
  String email;

  UserModel({
    required this.userName,
    required this.imageUrl,
    required this.email,
  });
}

class ChatModel {
  String userName;
  String imageUrl;
  String currentUser;

  ChatModel({
    required this.userName,
    required this.imageUrl,
    required this.currentUser,
  });
}
