import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit_clone/helper/auth.dart';
import 'package:reddit_clone/helper/firebase_helper.dart';
import 'package:reddit_clone/helper/shared_prefs_helper.dart';
import 'package:reddit_clone/models/holduser.dart';
import 'package:reddit_clone/provider/main_user_provider.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
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
        actions: [
          const Text(
            'Edit',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).pushNamed('/edit_profile');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
          Text('u/${context.watch<MainUserProvider>().user?.username}',
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionChip(
                label: Text(
                    '${context.watch<MainUserProvider>().user?.honor} Honor'),
                onPressed: () {},
              ),
              const SizedBox(width: 10),
              ActionChip(
                label: Text(context.watch<MainUserProvider>().user!.username),
                onPressed: () {},
              ),
            ],
          ),
          const ChoiceChip(
            label: Text('Verified'),
            selected: true,
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 229, 229, 229),
            ),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bio: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(context.watch<MainUserProvider>().user!.bio),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Sign Out'),
        icon: const Icon(Icons.logout),
        onPressed: () {
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
                          SharedPreferencesHelper.saveBool(false, "loggedIn");
                          signOut().then((value) => Navigator.of(context)
                              .pushReplacementNamed('/login'));
                        },
                        child: const Text('Sign Out')),
                  ],
                );
              });
        },
      ),
    );
  }
}
