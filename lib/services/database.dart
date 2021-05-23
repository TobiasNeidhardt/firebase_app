import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/club.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

//  collection reference
  final CollectionReference clubsCollection =
      Firestore.instance.collection("clubs");

  Future updateUserData(String name, String city, String category) async {
    return await clubsCollection.document(uid).setData({
      'name': name,
      'city': city,
      'category': category,
    });
  }

//  Club list from snapshot
  List<Club> _clubListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Club(
        name: doc.data['name'] ?? '',
        city: doc.data['city'] ?? '',
        category: doc.data['category'] ?? '',
      );
    }).toList();
  }

//  get clubs stream
  Stream<List<Club>> get clubs {
    return clubsCollection.snapshots().map(_clubListFromSnapshot);
  }
}
