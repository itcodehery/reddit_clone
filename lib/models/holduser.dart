import 'package:cloud_firestore/cloud_firestore.dart';

class HoldUser {
  final String userId;
  final String email;
  final int honor;
  final String username;

  HoldUser(
      {required this.userId,
      required this.email,
      required this.honor,
      required this.username});

  factory HoldUser.fromJson(Map<String, dynamic> json) {
    return HoldUser(
      userId: json['user_id'],
      email: json['email'],
      honor: json['honor'],
      username: json['username'],
    );
  }

  factory HoldUser.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return HoldUser(
      userId: doc['user_id'],
      email: doc['email'],
      honor: doc['honor'],
      username: doc['username'],
    );
  }
}
