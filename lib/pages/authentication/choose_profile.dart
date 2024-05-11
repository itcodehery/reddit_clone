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
            ElevatedButton(onPressed: () {}, child: const Icon(Icons.check)),
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
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                    // replace spaces with underscores
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Choose a profile picture:'),
                Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: _image != null
                        ? Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,
                          )
                        : const Icon(Icons.person, size: 200)),
                ElevatedButton(
                    onPressed: _openImagePicker,
                    child: const Text('Choose Image')),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
