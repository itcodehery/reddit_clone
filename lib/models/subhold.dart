import 'package:cloud_firestore/cloud_firestore.dart';

class Subhold {
  final String subholdId;
  final String subholdName;
  final String subholdDescription;
  final DocumentReference subholdModerator;
  final List<dynamic> posts;

  Subhold(
      {required this.subholdId,
      required this.subholdName,
      required this.subholdDescription,
      required this.subholdModerator,
      required this.posts});

  factory Subhold.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return Subhold(
      subholdId: doc.id,
      subholdName: doc['subholdName'],
      subholdDescription: doc['subholdDescription'],
      subholdModerator: doc['subholdModerator'],
      posts: doc['posts'],
    );
  }

  factory Subhold.fromJson(Map<String, dynamic> json) {
    return Subhold(
      subholdId: json['subholdId'],
      subholdName: json['subholdName'],
      subholdDescription: json['subholdDescription'],
      subholdModerator: json['subholdModerator'],
      posts: json['posts'],
    );
  }
}
