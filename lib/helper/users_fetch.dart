import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/models/holduser.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseAuth firebaseauth = FirebaseAuth.instance;

User? get getCurrentUser => firebaseauth.currentUser;

Future<void> createUser(HoldUser user) async {
  final userData = <String, dynamic>{
    "email": user.email,
    "user_id": user.userId,
    "honor": user.honor,
    "username": user.username,
  };

  firestore.collection("users").add(userData).then((DocumentReference doc) =>
      debugPrint('DocumentSnapshot added with ID: ${doc.id}'));
}

Future<List<HoldUser>> getUsers() async {
  final usersCollection = firestore.collection('users');
  final snapshot = await usersCollection.get();

  return snapshot.docs.map((doc) => HoldUser.fromSnapshot(doc)).toList();
}

Future<HoldUser> getUser(String userId) async {
  final userDoc = await firestore.collection('users').doc(userId).get();
  return HoldUser.fromSnapshot(
      userDoc as QueryDocumentSnapshot<Map<String, dynamic>>);
}

//saving user meta data like username, honor, bio
Future<void> saveUserData(String username, String bio, int honorpoints) async {
  final currentUser = firebaseauth.currentUser;
  if (currentUser == null) {
    // Handle situation where no user is signed in
    return;
  }

  final firestore = FirebaseFirestore.instance;
  final userRef = firestore.collection("users").doc(currentUser.uid);

  await userRef.set({
    'username': username,
    'bio': bio,
    'honorpoints': honorpoints,
  });

  debugPrint("User data saved! $username and $honorpoints and $bio");
}

Future<HoldUser?> getUserData() async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) {
    return null;
  }

  final firestore = FirebaseFirestore.instance;
  final userDoc =
      await firestore.collection("users").doc(currentUser.uid).get();

  if (!userDoc.exists) {
    return null;
  }

  final data = userDoc.data();
  return HoldUser(
      username: data!['username'] as String,
      honor: data['honorpoints'] as int,
      bio: data['bio'] as String,
      userId: currentUser.uid,
      email: currentUser.email!);
}
