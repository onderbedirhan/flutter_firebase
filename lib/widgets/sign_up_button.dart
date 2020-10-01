import 'package:flutter/material.dart';
import 'package:flutter_firebase/providers/firebase_auth_provider.dart';
import 'package:provider/provider.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  SignUpButton({this.formKey});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          signUpFunction(context);
        },
        child: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.blue,
      ),
    );
  }

  void signUpFunction(BuildContext context) {
    formKey.currentState.save();
    Provider.of<FirebaseAuthProvider>(context, listen: false).signUp();
  }
}
