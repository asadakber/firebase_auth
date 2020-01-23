import 'package:firebase_authentication/services/auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  final Function toggleView;
  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthServices _auth = AuthServices();
  final _formkey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.people, color: Colors.white),
              label: Text('Register', style: TextStyle(
                color: Colors.white
              ),)
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formkey,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                        ),
                        onChanged: (val) => email = val,
                        validator: (val) => val.isEmpty ? 'Enter a email' : null,
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                        onChanged: (val) => password = val,
                        validator: (val) => val.length < 6 ? 'Enter a password 6 + chars long' : null,
                        obscureText: true,
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        child: Text('Login', style: TextStyle(
                          color: Colors.white
                        ),),
                        onPressed: () async {
                          if(_formkey.currentState.validate()) {
                            dynamic result = _auth.SignInWithEmailAndPassword(email, password);
                            if(result == null) {
                              setState(() {
                                error = 'COULD NOT SIGN IN WITH THOSE CREDENTIALS';
                              });
                              print('error sign up');
                            } else {
                              print(' sign up');
                              print(result);
                            }
                          }

                        },
                        splashColor: Colors.redAccent,
                        color: Colors.blue,
                      ),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.0
                        ),
                      ),
                      RaisedButton(
                        child: Text('SignInAnom', style: TextStyle(
                          color: Colors.white
                        ),),
                        color: Colors.red,
                        splashColor: Colors.blueAccent,
                        onPressed: () async {
                          dynamic result = await _auth.SignInAnom();
                          if(result == null) {
                            print('error sign in anom');
                          } else {
                              print('sign in anom');
                              print(result);
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
