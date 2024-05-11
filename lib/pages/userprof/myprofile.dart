import 'package:flutter/material.dart';
import 'package:reddit_clone/models/holduser.dart';
import 'package:reddit_clone/helper/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reddit_clone/pages/authentication/login.dart';

class Myprofile extends StatelessWidget {
  Myprofile({Key? key, required this.user}) : super(key: key);

  final HoldUser user;

  final User? mainUser = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            'My Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
              color: Color.fromARGB(255, 114, 23, 17),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Stack(alignment: Alignment.bottomCenter, children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: double.maxFinite,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  Container(
                    height: 30,
                    width: double.maxFinite,
                    color: Colors.white,
                  )
                ],
              ),
              const Icon(
                Icons.account_circle,
                size: 80,
                color: Colors.black,
              ),
            ]),
            Text('u/${user.username}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionChip(label: Text('124k Honor')),
                SizedBox(width: 10),
                ActionChip(label: Text('67 comments')),
              ],
            ),
            const ChoiceChip(
              label: Text('Verified'),
              selected: true,
            ),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: getElevatedButton(context, () {
                  Navigator.of(context).pushNamed('/edit_profile');
                }, 'Edit Profile')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: getElevatedButton(context, () {
                //show an alert dialog
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Sign Out'),
                        content: const Text(
                            'Are you sure you want to sign out of your account?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () {
                                //delete account
                                signOut();
                                Navigator.of(context).pop();
                              },
                              child: const Text('Sign Out')),
                        ],
                      );
                    });
              }, 'Sign Out'),
            ),
          ]),
        ));
  }

  ElevatedButton getElevatedButton(
      BuildContext context, void Function() onPressed, String text) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize:
            const MaterialStatePropertyAll(Size.fromWidth(double.maxFinite)),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
