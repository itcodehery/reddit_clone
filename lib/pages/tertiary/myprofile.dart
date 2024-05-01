import 'package:flutter/material.dart';
import 'package:reddit_clone/models/user.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({Key? key, required this.user}) : super(key: key);

  final User user;

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
            ElevatedButton(
              onPressed: () {},
              child: const Text('Edit'),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('u/${user.username}', style: const TextStyle(fontSize: 24)),
              Text('${user.honor} honor', style: const TextStyle(fontSize: 18)),
              Text(user.email, style: const TextStyle(fontSize: 16)),
            ]),
          ),
        ));
  }
}
