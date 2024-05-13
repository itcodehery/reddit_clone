import 'package:flutter/material.dart';
import 'package:reddit_clone/models/holduser.dart';
import 'package:reddit_clone/pages/userprof/myprofile.dart';

class HoldAppBar extends StatelessWidget {
  const HoldAppBar({
    super.key,
    this.currentUser,
  });

  final HoldUser? currentUser;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'u/${currentUser!.username.isEmpty ? 'anonymous' : currentUser!.username}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: -0.5,
              color: Color.fromARGB(255, 114, 23, 17),
            ),
          ),
          Text(
            '${currentUser?.honor.toString()} honor',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 114, 23, 17),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
        ),
        IconButton(
          icon: const Icon(Icons.account_circle_outlined),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Myprofile(user: currentUser!);
            }));
          },
        ),
      ],
    );
  }
}
