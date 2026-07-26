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

import 'package:firebase_auth/firebase_auth.dart';

Future<String> authFlutterFire(
  String emailAddress,
  String password,
) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    return "valid";
  } on FirebaseAuthException catch (e) {
    // POSSIBLE ERRORS
    //
    // invalid-email
    // wrong-password
    // user-not-found
    //
    switch (e.code) {
      case 'INVALID_EMAIL':
        return "Μη έγκυρη διεύθυνση email. Παρακαλώ ελέγξτε το email σας.";
      case 'INVALID_PASSWORD':
        return "Λάθος κωδικός πρόσβασης. Παρακαλώ δοκιμάστε ξανά.";
      case 'EMAIL_NOT_FOUND':
        return "Ο χρήστης δεν βρέθηκε. Παρακαλώ ελέγξτε τη διεύθυνση email σας ή εγγραφείτε.";
      default:
        return "Παρουσιάστηκε σφάλμα κατά την σύνδεσης.";
    }
  }
}
