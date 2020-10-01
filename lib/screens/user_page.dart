import 'package:flutter/material.dart';
import 'package:flutter_firebase/providers/cloud_firestore_provider.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Page"),
      ),
      body: Column(
        children: [
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.cloud_upload),
                      hintText: "Please type name",
                      labelText: "Name",
                    ),
                    onSaved: (value) {
                      Provider.of<CloudFireStoreProvider>(context,
                              listen: false)
                          .userName = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.tv),
                      hintText: "Please type age",
                      labelText: "Age",
                    ),
                    onSaved: (value) {
                      Provider.of<CloudFireStoreProvider>(context,
                              listen: false)
                          .userAge = int.parse(value);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text(
                        "Add Firestore",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        formKey.currentState.save();
                        Provider.of<CloudFireStoreProvider>(context,
                                listen: false)
                            .fireStoreWriteData();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text(
                        "Update Firestore",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        formKey.currentState.save();
                        Provider.of<CloudFireStoreProvider>(context,
                                listen: false)
                            .fireStoreUpdateData();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
