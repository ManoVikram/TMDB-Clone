import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function onTap;
  final void Function(String email, String password) onPressed;

  RoundedButton({
    this.text,
    this.color = const Color(0xFF90CEA1),
    this.textColor = Colors.white,
    this.onTap,
    this.onPressed,
  });

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final String _userEmail =
        Provider.of<Auth>(context, listen: false).userEmail;
    final String _userPassword =
        Provider.of<Auth>(context, listen: false).userPassword;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: RaisedButton(
          onPressed: widget.onTap == null
              ? () {
                  widget.onPressed(
                    _userEmail,
                    _userPassword,
                  );
                }
              : widget.onTap,
          elevation: 7,
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 40,
          ),
          color: this.widget.color,
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
