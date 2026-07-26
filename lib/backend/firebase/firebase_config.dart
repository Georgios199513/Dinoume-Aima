import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyALNf60KIjoaOKs7kyhkWBgF8w6sJdasTU",
            authDomain: "dinoume-aima-app.firebaseapp.com",
            projectId: "dinoume-aima-app",
            storageBucket: "dinoume-aima-app.appspot.com",
            messagingSenderId: "447886900859",
            appId: "1:447886900859:web:56b6dd178366d62ddeacde",
            measurementId: "G-H2Z47W12WZ"));
  } else {
    await Firebase.initializeApp();
  }
}
