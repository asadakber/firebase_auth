import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  final String email;

  DatabaseService({this.uid, this.email});

    final databaseReference  = Firestore.instance;

    Future AddData(user) async {
      return await databaseReference.collection('users').document(user.uid).setData({
        'email': email,
        'uid': user.uid
      });
    }
}