import 'package:firebase_authentication/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthServices _auth = AuthServices();
  final _formkey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.people, color: Colors.white),
              label: Text('Login', style: TextStyle(
                  color: Colors.white
              ),)
          )
        ],
      ),
      body:  Container(
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
                        validator: (val) => val.isEmpty ? 'Enter a email' : null,
                        onChanged: (val) => email = val,
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
                        child: Text('Register', style: TextStyle(
                            color: Colors.white
                        ),),
                        onPressed: () async {
                          if(_formkey.currentState.validate()) {
                            dynamic result = await _auth.SignUpWithEmailAndPassword(email, password);
                            if(result == null) {
                              print('error sign up');
                              setState(() {
                                error = 'please supply a valid email and password';
                              });

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
