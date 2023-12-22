import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'Project.dart';
import 'firebase_options.dart';
import 'items.dart';

List<Project> listProjects = List.empty(growable: true);

void GetData() {
  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection("Project").get().then(
    (query) {
      print("Successfully completed");
      for (var doc in query.docs) {
        listProjects.add(Project(
            id: doc.id,
            nameProject: doc.data()['Name'],
            state: doc.data()['Status']));
      }
      print('Get successfully');
    },
    onError: (e) => print("Error completing: $e"),
  );
}

void UpdateStatus(bool status, String doc_id) {
  FirebaseFirestore db = FirebaseFirestore.instance;
  var updateState = db.collection("Project").doc(doc_id);
  updateState.update({"Status": status}).then(
      (value) => print("Successfully updated!"),
      onError: (e) => print("Error updating document $e"));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GetData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Project Controller",
      home: ProjectItems(),
      // home: Home(),
    );
  }
}
