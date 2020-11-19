import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "/signUpScreen";

  final Function toggleScreen;

  SignUpScreen({this.toggleScreen});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential _userCredential;

  Widget _textField(String labelText, bool isPassword) {
    return TextField(
      controller: isPassword ? _passwordTextController : _emailTextController,
      obscureText: isPassword ? true : false,
      cursorColor: Color(0xFF1DB954),
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
                      "NEW",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                    child: Text(
                      "USER",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(210, 110, 0, 0),
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
              padding: EdgeInsets.only(top: 35, left: 20, right: 20),
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
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: RaisedButton(
                        onPressed: () async {
                          try {
                            print(_emailTextController.text);
                            print(_passwordTextController.text);
                            _userCredential =
                                await _auth.createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text,
                            );
                          } on FirebaseAuthException catch (error) {
                            String message =
                                "ERROR: Enter a valid EMAIL and PASSWORD.";

                            if (error.code == 'weak-password') {
                              message = "The password provided is too weak.";
                            } else if (error.code == 'email-already-in-use') {
                              message =
                                  "The account already exists for that email.";
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
                          "SIGN UP",
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
                    margin: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
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
                                .pushReplacementNamed(LoginScreen.routeName); */
                            widget.toggleScreen();
                          },
                          child: Text(
                            "Log In",
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
