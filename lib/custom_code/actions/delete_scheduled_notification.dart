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

Future<bool> deleteScheduledNotification(
  DocumentReference? userRef,
  DateTime? scheduledTime,
) async {
  try {
    if (userRef == null || scheduledTime == null) {
      return false;
    }

    final pushNotificationCollection =
        FirebaseFirestore.instance.collection('ff_push_notifications');

    // Truncate the milliseconds of the scheduled time to ignore milliseconds
    final truncatedScheduledTime = scheduledTime
        .subtract(Duration(milliseconds: scheduledTime.millisecond % 1000));

    final formattedUserRef = "/users/" + userRef.id;

    print("Formatted UserRef: $formattedUserRef");
    print("Truncated Scheduled Time: $truncatedScheduledTime");

    final querySnapshot = await pushNotificationCollection
        .where('user_refs', isEqualTo: formattedUserRef)
        .where('scheduled_time', isEqualTo: truncatedScheduledTime)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DateTime retrievedScheduledTime =
          querySnapshot.docs.first.data()['scheduled_time'].toDate();
      final formattedRetrievedScheduledTime = retrievedScheduledTime.subtract(
          Duration(milliseconds: retrievedScheduledTime.millisecond % 1000));
      print("Retrieved Scheduled Time: $formattedRetrievedScheduledTime");

      querySnapshot.docs.first.reference.delete();
      return true;
    } else {
      return false;
    }
  } catch (error) {
    print('Error deleting notification: $error');
    return false;
  }
}
