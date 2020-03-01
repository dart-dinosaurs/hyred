import 'package:firebase_auth/firebase_auth.dart';
import 'package:main/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userCreation(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // anonymous sign-in
  Future anonSignIn() async {
    try {
      AuthResult res = await _auth.signInAnonymously();
      FirebaseUser user = res.user;
      return _userCreation(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  // email sign-in

  // email register

  // sign out

}