import 'package:flutter/material.dart';
import 'package:planty/screens/Registration/model/user_model.dart';

class AppProvider extends ChangeNotifier{
  UserModel? currentUser;
  void updateUser(UserModel? user){
    currentUser=user;
    notifyListeners();
  }
}