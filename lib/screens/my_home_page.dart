import 'package:flutter/material.dart';
import 'package:flutter_firebase/providers/firebase_auth_provider.dart';
import 'package:flutter_firebase/widgets/email_field.dart';
import 'package:flutter_firebase/widgets/password_field.dart';
import 'package:flutter_firebase/widgets/sign_in_button.dart';
import 'package:flutter_firebase/widgets/sign_up_button.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FluFire"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              EmailField(),
              SizedBox(height: 10),
              PasswordField(),
              SizedBox(height: 10),
              SignUpButton(formKey: formKey),
              SizedBox(height: 5),
              SignInButton(formKey: formKey),
              Text(Provider.of<FirebaseAuthProvider>(context).erorMessage),
            ],
          ),
        ),
      ),
    );
  }
}
