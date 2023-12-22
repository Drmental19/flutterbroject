import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';



void main() async {{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore db = FirebaseFirestore.instance;

  db.collection("Project").get().then(
        (query) {
      print("Successfully completed");
      for (var doc in query.docs) {
        print(doc.data()['Name']);
      }
    },
    onError: (e) => print("Error completing: $e"),
  );

  final updateState = db.collection("Project").doc("2Hb4s9QgbwP6QJ25ZK2L");
  updateState.update({"Status": false}).then(
          (value) => print("DocumentSnapshot successfully updated!"),
      onError: (e) => print("Error updating document $e"));
 }
}