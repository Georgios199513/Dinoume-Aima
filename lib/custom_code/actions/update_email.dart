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

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future<String> updateEmail(
    String newEmail, String oldEmail, String password) async {
  try {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      // Reauthenticate the user before updating the email
      final credential =
          EmailAuthProvider.credential(email: oldEmail, password: password);
      await user.reauthenticateWithCredential(credential);

      // Update the email address
      await user.updateEmail(newEmail);

      // Logout the user after updating email
      await auth.signOut();

      return 'valid';
    } else {
      return 'No user is currently signed in';
    }
  } catch (error) {
    return '$error';
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
