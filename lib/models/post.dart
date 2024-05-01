import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String userId;
  final String content;
  final String subhold;
  final Timestamp timestamp;
  final String title;
  final int scorepoints;
  final List<dynamic> comments;

  Post(
      {required this.id,
      required this.content,
      required this.userId,
      required this.subhold,
      required this.timestamp,
      required this.title,
      required this.scorepoints,
      required this.comments});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['post_id'],
      content: json['content'],
      subhold: json['subhold'],
      userId: json['author'],
      timestamp: json['timestamp'],
      title: json['title'],
      scorepoints: json['scorepoints'],
      comments: json['comments'],
    );
  }

  factory Post.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return Post(
      id: doc.id,
      content: doc['content'],
      subhold: doc['subhold'],
      userId: doc['author'],
      timestamp: doc['timestamp'],
      title: doc['title'],
      scorepoints: doc['scorepoints'],
      comments: doc['comments'],
    );
  }
}
