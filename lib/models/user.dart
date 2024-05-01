import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userId;
  final String email;
  final int honor;
  final String username;

  User(
      {required this.userId,
      required this.email,
      required this.honor,
      required this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      email: json['email'],
      honor: json['honor'],
      username: json['username'],
    );
  }

  factory User.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return User(
      userId: doc['user_id'],
      email: doc['email'],
      honor: doc['honor'],
      username: doc['username'],
    );
  }
}
