import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:firebase_authentication/modal/auth_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseReference = Firestore.instance;

  final String uid;
  AuthServices({this.uid});

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  Future SignInAnom() async {
    try {
      AuthResult _result = await _auth.signInAnonymously();
      FirebaseUser user = _result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future SignUpWithEmailAndPassword(String email, String password) async {
    try {

      AuthResult _result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = _result.user;
//      return user;
      await databaseReference.collection('users').document(user.uid).setData({
        'email': email,
        'uid': user.uid
      });
      return _userFromFirebaseUser(user);

    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future SignInWithEmailAndPassword(String email, String password) async {
    try {

      AuthResult _result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = _result.user;
//      return user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}