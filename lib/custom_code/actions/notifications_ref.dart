// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> notificationsRef(DocumentReference? userRef) async {
  // If userRef is null, return an empty string
  if (userRef == null) {
    return "";
  }

  String id = "";

  // Query the collection where "user_refs" is equal to the provided userRef
  await FirebaseFirestore.instance
      .collection("ff_push_notifications")
      .where("user_refs", isEqualTo: userRef)
      .get()
      .then((querySnapshot) {
    if (querySnapshot.docs.isNotEmpty) {
      // If documents are found, set the id variable to the ID of the first document
      id = querySnapshot.docs.first.id;
    }
  });

  return id;
}
