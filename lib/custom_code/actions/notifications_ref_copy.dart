// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Define an async function that retrieves the scheduled time of the first notification
Future<DateTime> notificationsRefCopy() async {
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection('ff_push_notifications')
      .orderBy('scheduled_time')
      .limit(1)
      .get();

  if (snapshot.docs.isNotEmpty) {
    DateTime scheduledTime =
        (snapshot.docs.first.data() as Map<String, dynamic>)['scheduled_time']
            .toDate();
    return scheduledTime;
  } else {
    throw Exception('No scheduled notifications found.');
  }
}
