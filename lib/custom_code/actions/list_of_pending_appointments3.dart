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

Future<List<DocumentReference>?> listOfPendingAppointments3(
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
        eventDate = (eventRef.data()!['EventDate'] as Timestamp).toDate();
        print("Event Dates---->$eventDate");
        // dynamic createdAtTimestamp = data['createdTime'];
        String? appointmentState = data['appointmentState'];
        // final difference = currentDate!.difference(createdAtTimestamp!);

        print("createdAtTimestamp: $eventDate");
        if (eventDate != null) {
          // Convert the "createdAt" timestamp to DateTime
          //DateTime createdAtDate = (eventDate as Timestamp).toDate();

          // Check if the date is in the past (less than or equal to the current date)
          if (!eventDate.isAfter(currentDate)) {
            if (appointmentState == "pending") {
              bloodAppointmentdocs.add(documentSnapshot.reference);
              // print("Closet Date ========> $closestDate");
            }
          }
        }
      }

      if (bloodAppointmentdocs.isNotEmpty) {
        return bloodAppointmentdocs;
      } else {
        print("No valid dates found.");
        return bloodAppointmentdocs;
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
