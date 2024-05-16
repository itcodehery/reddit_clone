import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/models/holduser.dart';

class FirebaseHelper {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseauth = FirebaseAuth.instance;

  User? get getCurrentUser => firebaseauth.currentUser;

  //create user
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

  //get a list of all the users
  Future<List<HoldUser>> getUsers() async {
    final usersCollection = firestore.collection('users');
    final snapshot = await usersCollection.get();

    return snapshot.docs.map((doc) => HoldUser.fromSnapshot(doc)).toList();
  }

  //get a single user's userDocument from user.uid
  Future<HoldUser> getUser(String userId) async {
    final userDoc = await firestore.collection('users').doc(userId).get();
    return HoldUser.fromSnapshot(
        userDoc as QueryDocumentSnapshot<Map<String, dynamic>>);
  }

  //saving user meta data like username, honor, bio
  Future<void> saveUserData(
      String username, String bio, int honorpoints) async {
    final currentUser = firebaseauth.currentUser;
    if (currentUser == null) {
      // Handle situation where no user is signed in
      debugPrint('No user signed in!');
      return;
    }

    final firestore = FirebaseFirestore.instance;
    final userRef = firestore.collection("userDocs").doc(currentUser.uid);

    await userRef.set({
      'userid': currentUser.uid,
      'email': currentUser.email,
      'username': username,
      'bio': bio,
      'honorpoints': honorpoints,
    });

    debugPrint("User data saved! $username and $honorpoints and $bio");
  }

  //get the currentUsers auth data
  Future<HoldUser?> getCurrentUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return null;
    }

    final firestore = FirebaseFirestore.instance;
    final userDoc =
        await firestore.collection("userDocs").doc(currentUser.uid).get();

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

  Future<void> getMainUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is signed in, proceed to fetch user data
      await getUser(user.uid);
    } else {
      // User is not signed in, handle the case (e.g., navigate to login)
      debugPrint('No user signed in');
    }
  }
}
