import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChooseProfile extends StatefulWidget {
  const ChooseProfile({Key? key}) : super(key: key);

  @override
  ChooseProfileState createState() => ChooseProfileState();
}

class ChooseProfileState extends State<ChooseProfile> {
  TextEditingController usernameController = TextEditingController();
  ImagePicker? picker = ImagePicker();
  dynamic _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Choose a username:'),
                const SizedBox(height: 20),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Choose a profile picture:'),
                ElevatedButton(
                    onPressed: () async {
                      final XFile? image =
                          await picker!.pickImage(source: ImageSource.gallery);
                      setState(() {
                        _image = File(image!.path);
                      });
                    },
                    child: const Text('Choose Image')),
                const SizedBox(height: 20),
                Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: _image != null
                        ? Image.file(
                            _image,
                            width: 200,
                            height: 200,
                          )
                        : const Icon(Icons.person, size: 200)),
                ElevatedButton(
                  onPressed: () {
                    // Save username to database
                    Navigator.pop(context);
                  },
                  child: const Text('Create Profile'),
                ),
              ],
            ),
          ),
        ));
  }
}
