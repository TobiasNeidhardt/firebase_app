import 'package:firebase_app/models/club.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ClubList extends StatefulWidget {
  const ClubList({Key key}) : super(key: key);

  @override
  _ClubListState createState() => _ClubListState();
}

class _ClubListState extends State<ClubList> {
  @override
  Widget build(BuildContext context) {
    final clubs = Provider.of<List<Club>>(context);

    clubs.forEach((club) {
      print(club.name);
      print(club.category);
      print(club.city);
    });

    return Container();
  }
}
