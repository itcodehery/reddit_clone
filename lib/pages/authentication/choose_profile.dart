import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ChooseProfile extends StatefulWidget {
  const ChooseProfile({Key? key}) : super(key: key);

  @override
  ChooseProfileState createState() => ChooseProfileState();
}

class ChooseProfileState extends State<ChooseProfile> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController aboutYouController = TextEditingController();

  //file to store the image
  File? _image;
  final _picker = ImagePicker();

  //to open the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Profile'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/widget_core');
                },
                child: const Icon(Icons.check)),
            const SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Choose a username:'),
                const SizedBox(height: 10),
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
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                    // replace spaces with underscores
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Your Bio:'),
                const SizedBox(height: 10),
                TextField(
                  controller: aboutYouController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'About You',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Choose a profile picture:'),
                const SizedBox(height: 10),
                Center(
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: _openImagePicker,
                          child: const Text('Choose Image')),
                      const Spacer(),
                      Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.black.withAlpha(90),
                              width: 1,
                            ),
                          ),
                          child: _image != null
                              ? Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                )
                              : const Icon(Icons.person, size: 60)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
