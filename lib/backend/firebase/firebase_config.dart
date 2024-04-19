import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC6_mCILLNHHGj9TXT10q9T9ldtdFmDau4",
            authDomain: "sibem-9cd5f.firebaseapp.com",
            projectId: "sibem-9cd5f",
            storageBucket: "sibem-9cd5f.appspot.com",
            messagingSenderId: "621032075696",
            appId: "1:621032075696:web:bd7700d9db4139c9c02675",
            measurementId: "G-5E5TLWZB8V"));
  } else {
    await Firebase.initializeApp();
  }
}
