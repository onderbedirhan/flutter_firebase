import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/user_page.dart';

class FirebaseAuthProvider with ChangeNotifier {
  String userEmail;
  String userPassword;
  bool isEmailVerified = false;
  UserCredential firebaseAuth;
  User firebaseUser;
  String erorMessage = "";

  void signUp() async {
    await Firebase.initializeApp();
    try {
      firebaseAuth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userEmail, password: userPassword);
      firebaseUser = firebaseAuth.user;
    } on FirebaseAuthException catch (e) {
      erorMessage = e.message;
    } catch (e) {
      erorMessage = e.message;
    }
    emailVerifyControl();
    notifyListeners();
  }

  void emailVerifyControl() async {
    if (!firebaseUser.emailVerified) {
      isEmailVerified = false;
      await firebaseUser.sendEmailVerification();
    }
  }

  void signIn(BuildContext context) async {
    await Firebase.initializeApp();
    try {
      firebaseAuth = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userEmail, password: userPassword);
      firebaseUser = firebaseAuth.user;
    } on FirebaseAuthException catch (e) {
      erorMessage = e.message;
    }
    emailSignInControl(context);
    notifyListeners();
  }

  void emailSignInControl(BuildContext context) {
    if (firebaseUser != null) {
      erorMessage = "Sign in succesfully ";
    } else if (firebaseUser == null) {
      erorMessage = "This email adress didnt created";
    }
    if (firebaseUser.emailVerified) {
      isEmailVerified = firebaseUser.emailVerified;
      erorMessage = "This mail already verified";
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserPage()));
    } else {
      erorMessage = "This mail didnt verified please check the mail box";
    }
  }
}
