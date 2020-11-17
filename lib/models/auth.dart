import 'package:flutter/widgets.dart';

class Auth with ChangeNotifier {
  String _email;
  String _password;

  set setUserEmail(String email) {
    _email = email;
    notifyListeners();
  }

  set setUserPassword(String password) {
    _password = password;
    notifyListeners();
  }

  String get userEmail => _email;

  String get userPassword => _password;
}
