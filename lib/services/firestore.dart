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

  Future registerBasicInformation(String fname, String lname, bool employer) async {
    return await userCollection.document(uid).updateData({
      'fname': fname,
      'lname': lname,
      'employer': employer,
    });
  }

  Future registerAddress(String street, String apartment, String city, String province, String postal) async {
    return await userCollection.document(uid).updateData({
      'street': street,
      'apartment': apartment,
      'city': city,
      'province': province,
      'postal': postal
    });
  }

  Future registerBusinessName(String businessName) async {
    return await userCollection.document(uid).updateData({
      'businessName': businessName,
    });
  }

  Future getData() async {
    return await userCollection.document(uid).get();
  }

  Future onUserRegister() async {
    return await userCollection.document(uid).setData({
      'registered': false,
    });
  }

  Future onUserFinishRegister() async {
    return await userCollection.document(uid).updateData({
      'registered': true,
    });
  }

  Stream<DocumentSnapshot> get userData {
    return userCollection.document(uid).snapshots();
  }
}