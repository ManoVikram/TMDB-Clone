import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/authenticationScreenFields/emailTextField.dart';
import '../widgets/authenticationScreenFields/passwordTextField.dart';
import '../widgets/authenticationScreenFields/alreadyHaveAnAccount.dart';
import '../widgets/roundedButton.dart';
import '../models/auth.dart';
import './loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/signUpScreen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  UserCredential userCredential;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SignUpBackground(
        stackChlid: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SIGN UP",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                "lib/assets/images/signup.svg",
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
                text: "Sign Up",
                color: Colors.pink[100],
                textColor: Colors.white,
                onPressed: () async {
                  print(Provider.of<Auth>(context, listen: false).userEmail);
                  print(Provider.of<Auth>(context, listen: false).userPassword);
                  print("Hello User!!");
                  userCredential = await _auth.createUserWithEmailAndPassword(
                    email: Provider.of<Auth>(context, listen: false).userEmail,
                    password:
                        Provider.of<Auth>(context, listen: false).userPassword,
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              AlreadyHaveAnAccount(
                login: false,
                onTapped: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpBackground extends StatelessWidget {
  final Widget stackChlid;

  SignUpBackground({@required this.stackChlid});

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
              "lib/assets/images/signupTop.png",
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "lib/assets/images/mainBottom.png",
              width: size.width * 0.25,
            ),
          ),
          stackChlid,
        ],
      ),
    );
  }
}
