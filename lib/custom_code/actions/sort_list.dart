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

Future<List<DocumentReference>?> sortList(
    List<DocumentReference> listToSort) async {
  // Retrieve snapshots for each reference and store them in a list
  List<DocumentSnapshot> snapshots = await Future.wait(
    listToSort.map((docRef) => docRef.get()),
  );

  // Sort the snapshots by the 'createdTime' field in ascending order
  snapshots.sort((a, b) {
    DateTime createdTimeA =
        (a.data() as Map<String, dynamic>)['createdTime'].toDate();
    DateTime createdTimeB =
        (b.data() as Map<String, dynamic>)['createdTime'].toDate();
    return createdTimeA.compareTo(createdTimeB);
  });

  // Extract and return the sorted references
  if (snapshots.map((snapshot) => snapshot.reference).toList().isNotEmpty) {
    return snapshots.map((snapshot) => snapshot.reference).toList();
  } else {
    print("No pending appointment.");
    return null;
  }
}
