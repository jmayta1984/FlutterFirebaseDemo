
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_demo/ui/event_screen.dart';
import 'package:flutter_firebase_demo/ui/login_screen.dart';


Future testData() async {
  Firestore db = Firestore.instance;

  var data = await db.collection('event_details').getDocuments();

  var details = data.documents.toList();

  details.forEach((element) {
    print(element.documentID);
  });
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    testData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Events',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginScreen(),
    );
  }
}
