import 'package:flutter/material.dart';
import 'package:jobbee/model.dart/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      images: [],
      firstName: '',
      lastName: '',
      phoneNo: '',
      basedOn: '',
      disType: '',
      edLevel: '',
      eddetail: '',
      workEx: '',
      skill: '',
      email: '',
      password: '',
      favorite: [],
      applied: []);

  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}



