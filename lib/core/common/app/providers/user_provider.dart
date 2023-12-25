import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tollxpress/feature/auth/data/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void initUser(UserModel? userModel) {
    if (_user != userModel) _user = userModel;
  }

  set user(UserModel? userModel) {
    if (_user != userModel){
      _user = userModel;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }
}
