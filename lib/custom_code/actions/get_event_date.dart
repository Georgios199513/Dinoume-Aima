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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<DateTime?> getEventDate(String? userId) async {
  try {
    // Get the Sub collection reference
    CollectionReference<Map<String, dynamic>> bloodAppointmentsRef =
        FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('blood_appointment');

    // Get the documents from the subcollection, ordered by the "createdTime" field in descending order
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await bloodAppointmentsRef.get();

    DateTime currentDate = DateTime.now();
    DateTime? closestDate;
    Duration? closestDifference;
    DocumentReference<Map<String, dynamic>>? closestEventRef;

    if (querySnapshot.docs.isNotEmpty) {
      for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
          in querySnapshot.docs) {
        Map<String, dynamic> data = documentSnapshot.data();
        dynamic eventRef = data['RelatedEvent'];
        dynamic createdAtTimestamp = data['createdTime'];
        print("createdAtTimestamp: $createdAtTimestamp");
        if (createdAtTimestamp != null) {
          // Convert the "createdAt" timestamp to DateTime
          DateTime createdAtDate = (createdAtTimestamp as Timestamp).toDate();

          // Check if the date is in the past (less than or equal to the current date)
          if (!createdAtDate.isAfter(currentDate)) {
            Duration difference = currentDate.difference(createdAtDate).abs();
            if (closestDifference == null || difference < closestDifference) {
              closestDifference = difference;
              closestDate = createdAtDate;
              closestEventRef =
                  eventRef as DocumentReference<Map<String, dynamic>>?;
              print("Closest Date ========> $closestDate");
            }
          }
        }
      }

      if (closestEventRef != null) {
        // Get the event document using the closest event reference
        DocumentSnapshot<Map<String, dynamic>> eventSnapshot =
            await closestEventRef.get();
        if (eventSnapshot.exists) {
          // Get the "eventDate" field from the event document
          DateTime eventDate =
              (eventSnapshot.data()!['eventDate'] as Timestamp).toDate();
          print("Event Date ========> $eventDate");
          return eventDate;
        } else {
          print("Event document does not exist.");
          return null;
        }
      } else {
        print("No valid dates found.");
        return null;
      }
    } else {
      print("No blood appointment documents found.");
      return null;
    }
  } catch (e) {
    print("Error fetching blood appointments: $e");
    return null;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
