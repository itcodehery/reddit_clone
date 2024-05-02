import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/models/user.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> createUser(User user) async {
  final userData = <String, dynamic>{
    "email": user.email,
    "user_id": user.userId,
    "honor": user.honor,
    "username": user.username,
  };

  firestore.collection("users").add(userData).then((DocumentReference doc) =>
      debugPrint('DocumentSnapshot added with ID: ${doc.id}'));
}

Future<List<User>> getUsers() async {
  final usersCollection = firestore.collection('users');
  final snapshot = await usersCollection.get();

  return snapshot.docs.map((doc) => User.fromSnapshot(doc)).toList();
}

Future<User> getUser(String userId) async {
  final userDoc = await firestore.collection('users').doc(userId).get();
  return User.fromSnapshot(
      userDoc as QueryDocumentSnapshot<Map<String, dynamic>>);
}
