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
            Text('${user.honor} honor points',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            const Divider(),
            Text(user.email, style: const TextStyle(fontSize: 16)),
            const Divider(),
          ]),
        ));
  }
}
