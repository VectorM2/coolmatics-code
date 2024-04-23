import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAVEo-z3mjHu_ZjHQHOKDismHxS5F1rueI",
            authDomain: "coolmatics-zisoxw.firebaseapp.com",
            projectId: "coolmatics-zisoxw",
            storageBucket: "coolmatics-zisoxw.appspot.com",
            messagingSenderId: "721323580984",
            appId: "1:721323580984:web:709d1d0fe2e6ba8d97d0cd"));
  } else {
    await Firebase.initializeApp();
  }
}
