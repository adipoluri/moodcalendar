import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moodcalendar/model/user.dart';
import 'package:moodcalendar/util/constants.dart';

class FireStoreUtils {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
}

Future<void> addNewUser(String uid, String name) {
  // Call the user"s CollectionReference to add a new user
  return FireStoreUtils.firestore
      .collection("users")
      .doc(uid)
      .set({
        "name": name,
        "lastInput": Timestamp.now(),
        "data": json.encode(defaultCalendar)
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<bool> checkIfUserExists(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FireStoreUtils.firestore.collection('users');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

