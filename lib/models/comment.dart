import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String id;
  final String text;
  final String authorId;
  final String postId;
  final bool isNested;

  Comment(
      {required this.isNested,
      required this.id,
      required this.text,
      required this.authorId,
      required this.postId});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['comment_id'],
      text: json['content'],
      authorId: json['author'],
      postId: json['post_id'],
      isNested: json['parent_comment_id'] == null ? false : true,
    );
  }

  factory Comment.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return Comment(
      id: doc.id,
      text: doc['content'],
      authorId: doc['author'],
      postId: doc['post_id'],
      isNested: doc['parent_comment_id'] == null ? false : true,
    );
  }
}
