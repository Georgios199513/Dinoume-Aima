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

Future<List<DocumentReference>?> listOfPendingAppointments2(
    String? userId) async {
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
    DateTime? eventDate;
    DateTime? closestDate;
    Duration? closestDifference;
    DocumentReference? ref;
    List<DocumentReference> bloodAppointmentdocs = [];

    if (querySnapshot.docs.isNotEmpty) {
      for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
          in querySnapshot.docs) {
        Map<String, dynamic> data = documentSnapshot.data();

        DocumentReference documentReference = data['RelatedEvent'];
        var eventRef = await FirebaseFirestore.instance
            .collection("Events")
            .doc(documentReference.id)
            .get();
        eventDate = eventRef.data()!['EventDate'].toDate();

        if (eventDate != null) {
          if (!eventDate.isAfter(currentDate)) {
            Duration difference = currentDate.difference(eventDate).abs();

            if (closestDifference == null || difference < closestDifference) {
              closestDifference = difference;
              ref = documentSnapshot.reference;
              closestDate = eventDate;
              print("Closet Date ========> $closestDate");
            }
          }
        }
      }

      for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
          in querySnapshot.docs) {
        Map<String, dynamic> data = documentSnapshot.data();
        DocumentReference documentReference = data['RelatedEvent'];
        var eventRef = await FirebaseFirestore.instance
            .collection("Events")
            .doc(documentReference.id)
            .get();
        eventDate = eventRef.data()!['EventDate'].toDate();
        print("Event Dates---->$eventDate");
        String? appointmentState = data['appointmentState'];

        print("createdAtTimestamp: $eventDate");
        if (eventDate != null) {
          DateTime createdAtDate = eventDate;

          if (!eventDate.isAfter(currentDate)) {
            Duration difference = currentDate.difference(eventDate).abs();
            if (difference.inDays <= 5 && documentSnapshot.reference == ref) {
              print("Excluding the Past latest appointment within 5 days");
            } else {
              bloodAppointmentdocs.add(documentSnapshot.reference);
            }
          }
        }
      }

      if (bloodAppointmentdocs.isNotEmpty) {
        return bloodAppointmentdocs;
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
