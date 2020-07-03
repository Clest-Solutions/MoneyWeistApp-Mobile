import 'package:firebase_auth/firebase_auth.dart';
import 'package:driver_app/models/driver.dart';
import 'package:driver_app/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create a user object from the the firebase user result
  Driver _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? Driver(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Driver> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //creating a user for the first time
  Future createFreshUser(
      {String email,
      String password,
      String name,
      int numberOfPickups,
      String phoneNumber}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateUserInfo(
          name: name,
          phoneNumber: phoneNumber,
          id: user.uid.substring(0,10),
          numberOfPickups: numberOfPickups);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register user with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
