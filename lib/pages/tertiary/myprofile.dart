import 'package:flutter/material.dart';
import 'package:reddit_clone/models/holduser.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({Key? key, required this.user}) : super(key: key);

  final HoldUser user;

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
          ]),
        ));
  }
}
