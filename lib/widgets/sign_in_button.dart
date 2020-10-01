import 'package:flutter/material.dart';
import 'package:flutter_firebase/providers/firebase_auth_provider.dart';
import 'package:provider/provider.dart';

class SignInButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  SignInButton({this.formKey});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          signInFunction(context);
        },
        child: Text(
          "Sign In",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.green,
      ),
    );
  }

  void signInFunction(BuildContext context) {
    formKey.currentState.save();
    Provider.of<FirebaseAuthProvider>(context, listen: false).signIn(context);
  }
}
