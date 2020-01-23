import 'package:firebase_authentication/auth/sign_in.dart';
import 'package:firebase_authentication/auth/sign_up.dart';
import 'package:firebase_authentication/modal/auth_modal.dart';
import 'package:firebase_authentication/screens/home_page.dart';
import 'package:firebase_authentication/services/auth.dart';
import 'package:firebase_authentication/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthServices().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyApp',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: Wrapper(),
      ),
    );
  }
}
