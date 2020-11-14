import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/auth.dart';

class EmailTextField extends StatefulWidget {
  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final _emailTextController = TextEditingController();

  String email;

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
        controller: _emailTextController,
        cursorColor: Colors.pink[200],
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: Color(0xFF90CEA1),
          ),
          hintText: "Email",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          email = value;
          Auth(email: email.trim());
          print(email);
        },
      ),
    );
  }
}
