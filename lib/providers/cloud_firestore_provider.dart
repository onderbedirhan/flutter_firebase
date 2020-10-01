import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CloudFireStoreProvider with ChangeNotifier {
  String userName;
  int userAge;
  int userNumberOfLike = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void fireStoreWriteData() async {
    await Firebase.initializeApp();
    firestore.collection("users").doc(userName).set(
      {
        "name": userName,
        "age": userAge,
        "numberOfLike": userNumberOfLike,
      },
    ).then((value) => debugPrint("ahmet eklendi"));
  }

  void fireStoreUpdateData() async {
    await Firebase.initializeApp();
    firestore.collection("users").doc(userName).update(
      {
        "name": userName,
        "age": userAge,
        "numberOfLike": FieldValue.increment(1),
      },
    );
  }

  void fireStoreReadData() async {
    await Firebase.initializeApp();
  }
}
