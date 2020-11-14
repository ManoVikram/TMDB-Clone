import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../models/auth.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;

  PasswordTextField({this.hintText});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _passwordTextController = TextEditingController();

  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _passwordTextController,
        obscureText: true,
        cursorColor: Colors.pink[200],
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Color(0xFF90CEA1),
          ),
          suffixIcon: Icon(Icons.visibility_off),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
        onChanged: (value) {
          password = value;
          Provider.of<Auth>(context, listen: false).setUserPassword = password;
          print(password);
        },
      ),
    );
  }
}
