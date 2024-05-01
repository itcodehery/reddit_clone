import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reddit_clone/models/post.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<List<Post>> getPosts() async {
  // Get a reference to the posts collection
  final postsCollection = firestore.collection('posts');

  // Fetch all documents from the collection
  final snapshot = await postsCollection.get();

  // Convert each document to a Post object
  return snapshot.docs.map((doc) => Post.fromSnapshot(doc)).toList();
}

Future<void> createPost(String title, String content, String community) async {
  // Get a reference to the posts collection
  final postsCollection = firestore.collection('posts');

  // Add a new document with the given data
  await postsCollection.add({
    'title': title,
    'content': content,
    'community': community,
    'timestamp': FieldValue.serverTimestamp(),
  });
}
