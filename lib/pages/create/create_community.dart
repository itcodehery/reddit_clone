import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reddit_clone/helper/communities_fetch.dart';

class CreateSubhold extends StatefulWidget {
  const CreateSubhold({Key? key}) : super(key: key);

  @override
  _CreateSubholdState createState() => _CreateSubholdState();
}

class _CreateSubholdState extends State<CreateSubhold> {
  String selectedValue = "1";
  final String communityGuidelines =
      "Subhold are communities for like-minded people. You will automatically become the moderator of the subhold you create. Remember to keep the community friendly and inclusive! Let's socialize and keep the convo alive!";
  // items to send to the database
  // title, content, community
  String communityTitle = "";
  String communityDescription = "";

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
            onPressed: () async {
              //save the post to the database
              if (communityTitle.isNotEmpty &&
                  communityDescription.isNotEmpty) {
                await createSubhold(
                        communityTitle, communityDescription, "haririoprivate")
                    .then((value) => showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "Subhold Created!",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Your subhold has been created. You are now the moderator of this community.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Okay"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Enter details of the subhold first!')));
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "TL;DR: Power = Responsibility",
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
              const SizedBox(height: 10),
              const Text("Your community will be: "),
              const SizedBox(height: 10),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                tileColor:
                    Theme.of(context).colorScheme.inversePrimary.withAlpha(100),
                title: Text(
                  "h/$communityTitle",
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: -0.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  communityDescription,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Subhold Details",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: getInputDecoration('Name of Hold'),
                maxLength: 100,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(" ", replacementString: "-"),
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
                onChanged: (value) {
                  setState(() {
                    communityTitle = value;
                    debugPrint(communityTitle);
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: getInputDecoration('About the Hold'),
                maxLength: 200,
                maxLines: 5,
                onChanged: (value) {
                  setState(() {
                    communityDescription = value;
                    debugPrint(communityDescription);
                  });
                },
              ),
            ],
          ),
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
