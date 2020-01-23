import 'package:firebase_authentication/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                dynamic result = _auth.SignOut();
                if(result == null) {
                  print('error sign out');
                } else {
                  print('sign out');
                  print(result);
                }
              },
              icon: Icon(Icons.people, color: Colors.white),
              label: Text('Logout', style: TextStyle(
                color: Colors.white
              ),)
          )
        ],
      ),
    );
  }
}
