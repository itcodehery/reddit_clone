import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reddit_clone/models/subhold.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<List<Subhold>> getSubholds() async {
  // Get a reference to the subholds collection
  final subholdsCollection = firestore.collection('subhold');

  // Fetch all documents from the collection
  final snapshot = await subholdsCollection.get();

  // Convert each document to a Subhold object
  return snapshot.docs.map((doc) => Subhold.fromSnapshot(doc)).toList();
}

Future<void> createSubhold(
    String name, String description, String moderator) async {
  // Get a reference to the subholds collection
  final subholdsCollection = firestore.collection('subhold');

  // Add a new document with the given data
  await subholdsCollection.add({
    'subholdName': name,
    'subholdDescription': description,
    'posts': DocumentReference,
    'subholdModerator': moderator,
  });
}
