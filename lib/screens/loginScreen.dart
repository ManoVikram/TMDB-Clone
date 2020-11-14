import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/authenticationScreenFields/emailTextField.dart';
import '../widgets/authenticationScreenFields/passwordTextField.dart';
import '../widgets/authenticationScreenFields/alreadyHaveAnAccount.dart';
import '../widgets/roundedButton.dart';
import '../models/auth.dart';
import './signUpScreen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  UserCredential userCredential;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: LoginBackground(
        stackChlid: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                "lib/assets/images/login.svg",
                height: size.height * 0.4,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              EmailTextField(),
              PasswordTextField(
                hintText: "Password",
              ),
              RoundedButton(
                text: "Login",
                color: Color(0xFF90CEA1),
                textColor: Colors.white,
                onPressed: () async {
                  try {
                    print(Provider.of<Auth>(context, listen: false).userEmail);
                    print(
                        Provider.of<Auth>(context, listen: false).userPassword);
                    print("Hello Login");
                    userCredential = await _auth.signInWithEmailAndPassword(
                      email:
                          Provider.of<Auth>(context, listen: false).userEmail,
                      password: Provider.of<Auth>(context, listen: false)
                          .userPassword,
                    );
                  } on FirebaseAuthException catch (error) {
                    String message =
                        "ERROR: Please enter the correct email and password.";

                    if (error.code == 'user-not-found') {
                      message = "No user found for that email.";
                    } else if (error.code == 'wrong-password') {
                      message = "Wrong password provided for that user.";
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
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              AlreadyHaveAnAccount(
                login: true,
                onTapped: () {
                  Navigator.of(context)
                      .pushReplacementNamed(SignUpScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginBackground extends StatelessWidget {
  final Widget stackChlid;

  LoginBackground({@required this.stackChlid});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "lib/assets/images/mainTop.png",
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "lib/assets/images/loginBottom.png",
              width: size.width * 0.4,
            ),
          ),
          stackChlid,
        ],
      ),
    );
  }
}
