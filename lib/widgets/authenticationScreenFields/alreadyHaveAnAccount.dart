import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final bool login;
  final Function onTapped;

  AlreadyHaveAnAccount({this.login, this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account? " : "Already having an account? ",
          style: TextStyle(
            color: Colors.pink[200],
          ),
        ),
        InkWell(
          onTap: onTapped,
          child: Text(
            login ? "Sign Up" : "Log In",
            style: TextStyle(
              color: Colors.indigo[400],
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
