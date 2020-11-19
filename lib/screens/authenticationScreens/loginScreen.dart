import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './signUpScreen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/loginScreen";

  final Function toggleScreen;

  LoginScreen({this.toggleScreen});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential _userCredential;

  Widget _textField(String labelText, bool isPassword) {
    return TextField(
      controller: isPassword ? _passwordTextController : _emailTextController,
      obscureText: isPassword ? true : false,
      cursorColor: Color(0xFF1DB954),
      keyboardType:
          isPassword ? TextInputType.text : TextInputType.emailAddress,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        focusColor: Color(0xFF1DB954),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF1DB954),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 40, 0, 0),
                    child: Text(
                      "Hello",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                    child: Text(
                      "There",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(222, 110, 0, 0),
                    child: Text(
                      ".",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1DB954),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 35,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  /* TextField(
                    decoration: InputDecoration(
                      labelText: "EMAIL",
                      labelStyle: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF1DB954),
                        ),
                      ),
                    ),
                  ), */
                  _textField("EMAIL", false),
                  SizedBox(
                    height: 20,
                  ),
                  /* TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "PASSWORD",
                      labelStyle: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF1DB954),
                        ),
                      ),
                    ),
                  ), */
                  _textField("PASSWORD", true),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment(1, 0),
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 20,
                    ),
                    child: InkWell(
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Color(0xFF1DB954),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: RaisedButton(
                        onPressed: () async {
                          try {
                            print(_emailTextController.text);
                            print(_passwordTextController.text);
                            _userCredential =
                                await _auth.signInWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text,
                            );
                          } on FirebaseAuthException catch (error) {
                            String message =
                                "ERROR: Enter correct EMAIL and PASSWORD.";

                            if (error.code == 'user-not-found') {
                              message = "No user found for that EMAIL.";
                            } else if (error.code == 'wrong-password') {
                              message =
                                  "Wrong PASSWORD provided for that user.";
                            }

                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                                backgroundColor: Theme.of(context).errorColor,
                              ),
                            );
                          } catch (error) {
                            print(error);
                          }
                        },
                        elevation: 7,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 40,
                        ),
                        color: Color(0xFF1DB954),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    // color: Colors.transparent,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: RaisedButton(
                        onPressed: () {},
                        elevation: 7,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 40,
                        ),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Image.asset(
                              "lib/assets/images/GoogleLogo.png",
                              width: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "LOGIN USING GOOGLE",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New to TMDB?",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            /* Navigator.of(context)
                                .pushReplacementNamed(SignUpScreen.routeName); */
                            widget.toggleScreen();
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Color(0xFF1DB954),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
