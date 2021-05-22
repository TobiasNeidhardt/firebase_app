import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // return Container(
    //     child: Text("Home"),
    // );
    return Scaffold(
        appBar: AppBar(
      title: Text("Home Screen"),
      backgroundColor: Colors.brown[400],
      elevation: 0.0,
      actions: [
        TextButton(
            onPressed: () async {
              _auth.signOut();
            },
            child: Text(
              "Logout",
              style: TextStyle(color: Colors.black),
            ))
      ],
    ));
  }
}
