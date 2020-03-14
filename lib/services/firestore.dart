import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  final String uid;
  final CollectionReference userCollection = Firestore.instance.collection('users');

  FirestoreService({ this.uid });

  Future updateUserData(String fname, String lname, String background, String bio) async {
    return await userCollection.document(uid).setData({
      'registered': true,
      'fname': fname,
      'lname': lname,
      'background': background,
      'bio': bio
    });
  }

  Future onUserRegister() async {
    return await userCollection.document(uid).setData({
      'registered': false,
    });
  }

  Future onUserFinishRegister() async {
    return await userCollection.document(uid).setData({
      'registered': true,
    });
  }

  Stream<DocumentSnapshot> get userData {
    return userCollection.document(uid).snapshots();
  }
}