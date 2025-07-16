import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAar4CmFPAdHV1QR74kzsgT0DtAkEhIvNM",
            authDomain: "anvatrix-1wjj3q.firebaseapp.com",
            projectId: "anvatrix-1wjj3q",
            storageBucket: "anvatrix-1wjj3q.firebasestorage.app",
            messagingSenderId: "61572356914",
            appId: "1:61572356914:web:0579fe40b25261594e552b"));
  } else {
    await Firebase.initializeApp();
  }
}
