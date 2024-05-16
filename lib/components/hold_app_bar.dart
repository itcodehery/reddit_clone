import 'package:flutter/material.dart';
import 'package:reddit_clone/pages/userprof/myprofile.dart';

class HoldAppBar extends StatelessWidget {
  const HoldAppBar({
    super.key,
  });

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
      title: const Text('The Hold'),
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
              return const Myprofile();
            }));
          },
        ),
      ],
    );
  }
}
