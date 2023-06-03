import 'package:flutter/material.dart';

class LoginModel with ChangeNotifier {
  String username;

  LoginModel({
    required this.username,
  });

  String getUsername() {
    return username;
  }

  void setUsername(String username) {
    this.username = username;
    notifyListeners();
  }
}
