import 'package:flutter/material.dart';
import 'package:flutter_firebase/providers/firebase_auth_provider.dart';
import 'package:provider/provider.dart';

class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
        hintText: "Please type the email adress",
        labelText: "Email",
      ),
      onSaved: (value) {
        Provider.of<FirebaseAuthProvider>(context, listen: false).userEmail =
            value;
      },
    );
  }
}
