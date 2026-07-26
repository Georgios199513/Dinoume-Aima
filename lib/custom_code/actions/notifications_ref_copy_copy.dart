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

Future<String> notificationsRefCopyCopy(String? userRef) async {
  // return document id from ff_push_notification if "user_ref" is equal to userRef
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('ff_push_notifications')
      .where('user_refs', isEqualTo: userRef)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    print(querySnapshot.docs.first.reference.path);
    return querySnapshot.docs.first.reference.path;
  }

  // If no matching documents are found, return an empty string
  return "";
}
