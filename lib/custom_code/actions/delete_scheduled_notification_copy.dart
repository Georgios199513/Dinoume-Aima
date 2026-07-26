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

Future<bool> deleteScheduledNotificationCopy(
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

    final formattedUserRef = "users/" + userRef.id;

    print("Formatted UserRef: $formattedUserRef");
    print("Truncated Scheduled Time: $truncatedScheduledTime");

    final lowerBound = truncatedScheduledTime;
    final upperBound = truncatedScheduledTime.add(
        const Duration(seconds: 1)); // Add one second to create an upper bound
    print("$upperBound");
    // Set the static scheduled time (August 31, 2023, 16:30:00 UTC)
    final staticScheduledTime = DateTime.utc(2023, 8, 31, 16, 30);

    // Given local schedule time
    DateTime localScheduleTime = DateTime(2023, 8, 23, 16, 30, 0, 319);

    // Convert local time to UTC
    DateTime utcScheduleTime = localScheduleTime.toUtc();

    // Create a Firestore Timestamp object
    Timestamp firebaseTimestamp = Timestamp.fromDate(utcScheduleTime);

    // Now, you can use `firebaseTimestamp` in your Firestore document
    print("Firebase Schedule Time: $firebaseTimestamp");

    print("staticScheduledTime =====> ${scheduledTime}");

    final querySnapshot = await pushNotificationCollection
        .where('user_refs', isEqualTo: formattedUserRef)
        .where('scheduled_time', isEqualTo: scheduledTime)
        // .where('scheduled_time', isGreaterThanOrEqualTo: lowerBound)
        // .where('scheduled_time', isLessThan: upperBound)
        .get();
    print("Query Snapshpt Length ===> ${querySnapshot.docs.length}");

    if (querySnapshot.docs.isNotEmpty) {
      // DateTime retrievedScheduledTime =
      //     querySnapshot.docs.first.data()['scheduled_time'].toDate();
      // final formattedRetrievedScheduledTime = retrievedScheduledTime.subtract(
      //     Duration(milliseconds: retrievedScheduledTime.millisecond % 1000));
      // print("Retrieved Scheduled Time: $formattedRetrievedScheduledTime");

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
