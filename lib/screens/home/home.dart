import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/club.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:firebase_app/screens/home/club_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Club>>.value(
      value: DatabaseService().clubs,
      child: Scaffold(
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
        ),
        body: ClubList(),
      ),
    );
  }
}
