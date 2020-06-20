import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/ui/event_screen.dart';
import 'package:flutter_firebase_demo/ui/login_screen.dart';
import 'package:flutter_firebase_demo/utils/authentication.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();

    Authentication auth = Authentication();
    auth.getUser().then((user) {
      MaterialPageRoute route;

      if (user != null) {
        route = MaterialPageRoute(builder: (context) => EventScreen());
      } else {
        route = MaterialPageRoute(builder: (context) => LoginScreen());
      }
      Navigator.pushReplacement(context, route);
    }).catchError((err) => print(err));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
