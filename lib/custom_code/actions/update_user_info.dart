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
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> updateUserInfo(
  String displayName,
  String phoneNumber,
) async {
  String returnMessage = "success";

  try {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Update user profile display name
      await user.updateDisplayName(displayName);
      await user.updatePhoneNumber(phoneNumber as PhoneAuthCredential);
    } else {
      return "User not signed in.";
    }
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'invalid-email':
        returnMessage = "An error occurred while updating user information.";
        break;
      case 'weak-password':
        returnMessage = "An error occurred while updating user information.";
        break;
      case 'wrong-password':
        returnMessage = "An error occurred while updating user information.";
        break;
      default:
        returnMessage = "An error occurred while updating user information.";
        break;
    }
  } catch (e) {
    returnMessage = "An error occurred while updating user information.";
  }

  return returnMessage;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
