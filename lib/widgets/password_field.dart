import 'package:flutter/material.dart';
import 'package:flutter_firebase/providers/firebase_auth_provider.dart';
import 'package:provider/provider.dart';

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
        hintText: "Please type the password",
        labelText: "Password",
      ),
      onSaved: (value) {
        Provider.of<FirebaseAuthProvider>(context, listen: false).userPassword =
            value;
      },
    );
  }
}
