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

Future<DocumentReference?> newestAppointmentDoc(String? userId) async {
  try {
    // Get the Sub collection reference
    CollectionReference<Map<String, dynamic>> bloodAppointmentsRef =
        FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('blood_appointment');

    // Get the documents from the subcollection
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await bloodAppointmentsRef.get();

    DateTime? newestEventDate;
    DocumentReference? newestAppointmentRef;

    if (querySnapshot.docs.isNotEmpty) {
      for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
          in querySnapshot.docs) {
        Map<String, dynamic> data = documentSnapshot.data();

        DocumentReference documentReference = data['RelatedEvent'];
        var eventRef = await FirebaseFirestore.instance
            .collection("Events")
            .doc(documentReference.id)
            .get();
        DateTime eventDate =
            (eventRef.data()!['EventDate'] as Timestamp).toDate();

        // Check if the appointment state is "pending"
        String appointmentState = data['appointmentState'];
        if (appointmentState == "pending" || appointmentState == "completed") {
          if (newestEventDate == null || eventDate.isAfter(newestEventDate)) {
            newestEventDate = eventDate;
            newestAppointmentRef = documentSnapshot.reference;
          }
        }
      }

      if (newestAppointmentRef != null) {
        return newestAppointmentRef;
      } else {
        print("No valid appointments found.");
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
