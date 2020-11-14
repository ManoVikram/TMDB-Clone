import 'package:flutter/widgets.dart';

class Auth with ChangeNotifier {
  final String email;
  final String password;

  Auth({this.email, this.password});

  String get userEmail => email;

  String get userPassword => password;
}
