import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit_clone/helper/communities_fetch.dart';
import 'package:reddit_clone/models/subhold.dart';
import 'package:reddit_clone/provider/main_user_provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String selectedValue = "1";
  String communityGuidelines =
      "Remember to keep the community friendly and inclusive! Before creating a post, please take a moment to review the community's guidelines. These guidelines help the moderators maintain a positive environment for everyone. Let's be respectful of each other's opinions and have productive discussions!";
  // items to send to the database
  // title, content, community
  Future<List<Subhold>>? subholds;
  Subhold? _selectedSubhold;

  //controllers
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void savePost() async {
    if (_selectedSubhold == null) {
      // Handle case where no subhold is selected
      return;
    }

    // Get additional post information (title, content, etc.)
    String title = titleController.text; // Get title from UI
    String content = contentController.text; // Get content from UI

    // Create a map to store post data
    final postData = {
      'author': Provider.of<MainUserProvider>(context, listen: false).username,
      'title': title,
      'content': content,
      'subholdId':
          _selectedSubhold!.subholdId, // Assuming 'id' field in Subhold
      'scorepoints': 0,
      'comments': [],
      'timestamp': DateTime.now(),
    };

    // Get a reference to the posts collection
    final postsCollection = firestore.collection('posts');

    // Add the post data to Firestore
    await postsCollection.add(postData).then((documentReference) {
      debugPrint(
          'Post saved successfully! Document ID: ${documentReference.id}');
      // Optionally clear post information or show success message
    }).catchError((error) {
      debugPrint('Error saving post: $error');
      return Future<Null>.value();
    });
  }

  @override
  void initState() {
    super.initState();
    subholds = getSubholds();
  }

  @override
  Widget build(BuildContext context) {
    //page to create a post under our username
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Create Post',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
                color: Color.fromARGB(255, 114, 23, 17))),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: savePost,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "TL;DR: Be Respectful",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    communityGuidelines,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Post Details",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: getInputDecoration('Title'),
                maxLength: 100,
                controller: titleController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: getInputDecoration('Content'),
                maxLength: 200,
                maxLines: 5,
                controller: contentController,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Community",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  title: const Text('Choose a Community:'),
                  trailing: FutureBuilder<List<Subhold>>(
                    future: subholds,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return DropdownButton<Subhold>(
                          value: _selectedSubhold,
                          onChanged: (Subhold? newValue) {
                            setState(() {
                              _selectedSubhold = newValue;
                            });
                          },
                          items: snapshot.data!
                              .map<DropdownMenuItem<Subhold>>((Subhold value) {
                            return DropdownMenuItem<Subhold>(
                              value: value,
                              child: Text(value.subholdName),
                            );
                          }).toList(),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                )),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  InputDecoration getInputDecoration(String hintText) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(255, 232, 137, 108), width: 2.0),
      ),
      hintText: hintText,
    );
  }
}
