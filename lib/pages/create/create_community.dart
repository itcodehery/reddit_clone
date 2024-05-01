import 'package:flutter/material.dart';

class CreateSubhold extends StatefulWidget {
  const CreateSubhold({Key? key}) : super(key: key);

  @override
  _CreateSubholdState createState() => _CreateSubholdState();
}

class _CreateSubholdState extends State<CreateSubhold> {
  String selectedValue = "1";
  String communityGuidelines =
      "Subhold are communities for like-minded people. You will automatically become the moderator of the subhold you create. Remember to keep the community friendly and inclusive! Let's socialize and keep the convo alive!";
  // items to send to the database
  // title, content, community
  String communityTitle = " ";
  String communityDescription = " ";
  String community = " ";

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
        title: const Text('Create a Subhold',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
                color: Color.fromARGB(255, 114, 23, 17))),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              //save the post to the database
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "TL;DR: Power = Responsibility",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    communityGuidelines,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Subhold Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: getInputDecoration('Name of Hold'),
                maxLength: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: getInputDecoration('About the Hold'),
                maxLength: 200,
                maxLines: 5,
              ),
            ),
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
