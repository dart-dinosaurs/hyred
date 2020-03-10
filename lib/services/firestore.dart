import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  final String uid;
  final CollectionReference userCollection = Firestore.instance.collection('users');

  FirestoreService({ this.uid });

  Future updateUserData(String fname, String lname, String background, String bio) async {
    return await userCollection.document(uid).setData({
      'fname': fname,
      'lname': lname,
      'background': background,
      'bio': bio
    });
  }
}