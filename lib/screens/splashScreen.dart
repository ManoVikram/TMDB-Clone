import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TMDB",
                style: TextStyle(
                  fontSize: 80,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                ".",
                style: TextStyle(
                  fontSize: 80,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1DB954),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          LinearProgressIndicator(
            backgroundColor: Colors.greenAccent[100],
            valueColor: AlwaysStoppedAnimation(Color(0xFF1DB954)),
            minHeight: 6,
          ),
        ],
      ),
    );
  }
}
