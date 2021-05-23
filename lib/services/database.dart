import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/club.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

//  collection reference
  final CollectionReference clubsCollection =
      FirebaseFirestore.instance.collection("clubs");

  Future updateUserData(String name, String city, String category) async {
    return await clubsCollection.doc(uid).set({
      'name': name,
      'city': city,
      'category': category,
    });
  }

//  Club list from snapshot
  List<Club> _clubListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Club(
        name: doc['name'] ?? '',
        city: doc['city'] ?? '',
        category: doc['category'] ?? '',
      );
    }).toList();
  }

//  get clubs stream
  Stream<List<Club>> get clubs {
    return clubsCollection.snapshots().map(_clubListFromSnapshot);
  }
}
