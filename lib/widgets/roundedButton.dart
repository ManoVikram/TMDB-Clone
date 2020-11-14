import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function onPressed;

  RoundedButton({
    this.text,
    this.color = const Color(0xFF90CEA1),
    this.textColor = Colors.white,
    this.onPressed,
  });

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: RaisedButton(
          onPressed: widget.onPressed,
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
