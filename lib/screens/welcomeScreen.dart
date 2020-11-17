import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import './loginScreen.dart';
// import './signUpScreen.dart';
import './authenticationScreens/loginScreen.dart';
import './authenticationScreens/signUpScreen.dart';
import '../widgets/roundedButton.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = "/welcomeScreen";

  @override
  Widget build(BuildContext context) {
    return WelcomeBackground(
      stackItem: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to TMDB",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
            ),
            SvgPicture.asset(
              "lib/assets/images/conversation.svg",
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
            ),
            /* ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.8,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                },
                elevation: 7,
                color: Color(0xFF90CEA1),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                /* padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 50,
                ), */
                child: Text("Login"),
              ),
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.8,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(SignUpScreen.routeName);
                },
                elevation: 7,
                // color: Color(0xFF90CEA1),
                // textColor: Colors.white,
                color: Colors.pink[100],
                textColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                /* padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 50,
                ), */
                child: Text("Sign Up"),
              ),
            ), */
            RoundedButton(
              text: "Log In",
              textColor: Colors.white,
              color: Color(0xFF90CEA1),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName);
              },
            ),
            RoundedButton(
              text: "Sign Up",
              textColor: Colors.black87,
              color: Colors.pink[100],
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(SignUpScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeBackground extends StatelessWidget {
  final Widget stackItem;

  WelcomeBackground({@required this.stackItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "lib/assets/images/mainTop.png",
              // color: Colors.blue,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "lib/assets/images/mainBottom.png",
              // color: Colors.blue,
              width: MediaQuery.of(context).size.width * 0.2,
            ),
          ),
          stackItem,
        ],
      ),
    );
  }
}
