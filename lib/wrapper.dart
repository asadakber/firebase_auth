import 'package:firebase_authentication/auth/sign_in.dart';
import 'package:firebase_authentication/auth/sign_up.dart';
import 'package:firebase_authentication/screens/authenticate.dart';
import 'package:firebase_authentication/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modal/auth_modal.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if(user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
