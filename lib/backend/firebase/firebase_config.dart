import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA0W3xCvuDw4Rm4qowRxctwEanRNuPfQfs",
            authDomain: "uvpixcel.firebaseapp.com",
            projectId: "uvpixcel",
            storageBucket: "uvpixcel.appspot.com",
            messagingSenderId: "476732253727",
            appId: "1:476732253727:web:3fab87c6dd8f51f939d72a",
            measurementId: "G-7HJBKPFDQC"));
  } else {
    await Firebase.initializeApp();
  }
}
