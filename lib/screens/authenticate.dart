import 'package:firebase_authentication/auth/sign_in.dart';
import 'package:firebase_authentication/auth/sign_up.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn) {
      return Login(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
