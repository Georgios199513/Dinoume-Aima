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

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'; // Correct import for internet_connection_checker_plus
import 'package:http/http.dart' as http; // For making HTTP requests
import 'dart:async';

Future<bool> checkInternet10Mbps() async {
  // Check if there is an active internet connection using InternetConnectionCheckerPlus
  bool hasInternetConnection = await InternetConnection().hasInternetAccess;

  if (hasInternetConnection) {
    try {
      // Start a stopwatch to measure the time taken for the HTTP request
      var stopwatch = Stopwatch()..start();
      var link =
          "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/k5rkp401fo3q/confetti-4.gif";

      // Send an HTTP request
      var response = await http.get(Uri.parse(link));
      print("Link: $link");
      // Stop the stopwatch once the response is received
      stopwatch.stop();

      // Calculate the download time in seconds
      var timeInSeconds = stopwatch.elapsedMilliseconds / 1000;
      print("Get Time in Seconds: $timeInSeconds");

      // Get the size of the file in bits (response.contentLength gives size in bytes)
      var fileSizeInBits = response.contentLength! * 8;
      print("File size: $fileSizeInBits");

      // Assume a connection speed of 10 Mbps (10 million bits per second)
      var connectionSpeedMbps = 10 * 1000000; // 10 Mbps in bits per second

      // Calculate the download time for the file size
      var expectedDownloadTime = (fileSizeInBits / connectionSpeedMbps);
      var extendedExpectedTime =
          expectedDownloadTime + expectedDownloadTime * 0.2;
      print("Expected Download speed: $expectedDownloadTime Mbps");

      // Check if the actual download time is greater than 3.2 seconds
      if (timeInSeconds >= extendedExpectedTime) {
        print(
            "Download time is more than extended $extendedExpectedTime seconds: $timeInSeconds seconds");
        FFAppState().update(() {
          FFAppState().internetConnection = false;
        });
        return false; // Download took longer than 3.2 seconds
      } else {
        print("Download time is within limit: $expectedDownloadTime seconds");
        FFAppState().update(() {
          FFAppState().internetConnection = true;
        });
        return true; // Download was within the 3.2-second limit
      }
    } catch (e) {
      print("Error calculating download time: $e");
      FFAppState().update(() {
        FFAppState().internetConnection = false;
      });
      return false; // Return false if there's an error
    }
  } else {
    // Return false if there is no active internet connection
    print("No active internet connection");
    FFAppState().update(() {
      FFAppState().internetConnection = false;
    });
    return false;
  }
}

// Calculate the speed in Mbps (Megabits per second)
//var speedMbps = fileSizeInBits / (timeInSeconds * 1000000);

// Print the speed for debugging purposes
//print("Download speed: $speedMbps Mbps");

// Check if the speed is more than 10 Mbps
// if (speedMbps > 10) {
//       print("Internet speed is faster than 10 Mbps");
//       return 1; // Speed is more than 10 Mbps
//     } else {
//       print("Internet speed is slower than 10 Mbps");
//       return 0; // Speed is less than or equal to 10 Mbps
//     }
//   } catch (e) {
//     // Return 0 if an exception occurs
//     print("Error calculating internet speed: $e");
//     return 0;
//   }
// } else {
//   // Return -1 if there is no active internet connection
//   print("No active internet connection");
//   return -1;
// }
