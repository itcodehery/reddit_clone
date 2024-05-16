import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reddit_clone/helper/shared_prefs_helper.dart';
import 'package:reddit_clone/helper/firebase_helper.dart';

class ChooseProfile extends StatefulWidget {
  const ChooseProfile({Key? key}) : super(key: key);

  @override
  ChooseProfileState createState() => ChooseProfileState();
}

class ChooseProfileState extends State<ChooseProfile> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController aboutYouController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //file to store the image
  File? image;
  final _picker = ImagePicker();

  //to open the image picker
  Future<void> openImagePicker() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create your Hold Profile'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Choose a username:'),
                const SizedBox(height: 10),
                TextFormField(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text('Your Bio:'),
                const SizedBox(height: 10),
                TextFormField(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a bio';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            //save the user data
            FirebaseHelper()
                .saveUserData(
              usernameController.text,
              aboutYouController.text,
              0,
            )
                .then((_) {
              SharedPreferencesHelper.saveBool(true, 'profileCreated');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile Created!'),
                  duration: Duration(seconds: 3),
                ),
              );
            }).then((_) =>
                    Navigator.of(context).pushReplacementNamed('/widget_core'));
          }
        },
        icon: const Icon(Icons.create_outlined),
        label: const Text('Create Profile'),
      ),
    );
  }
}
