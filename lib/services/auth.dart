import 'package:firebase_app/models/user.dart';
import 'package:firebase_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_app/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//  Create User Object based on Firebase User
  User _userFromFireBaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user) => _userFromFireBaseUser(user));   this is the same as the line below
        .map(_userFromFireBaseUser);
  }

//  Sign in anonym
  Future signInAnonym() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Sign in with mail and pw
  Future loginWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

//register with mail and pw
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //Create a new document for the user with the uid
      await DatabaseService(uid:user.uid).updateUserData("Würzburger Fussballclub", "Würzburg", "Sport");
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }
//Signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
