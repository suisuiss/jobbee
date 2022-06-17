import 'package:flutter/foundation.dart';
import 'package:jobbee/model.dart/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      images: [],
      firstName: '',
      lastName: '',
      phoneNo: '',
      basedOn: '',
      edLevel: '',
      eddetail: '',
      workEx: '',
      skill: '',
      email: '',
      password: '');

  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
