import 'package:flutter/material.dart';
import 'package:reddit_clone/models/holduser.dart';
import 'package:reddit_clone/pages/tertiary/myprofile.dart';

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
        onPressed: () {},
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'u/haririoprivate',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: -0.5,
              color: Color.fromARGB(255, 114, 23, 17),
            ),
          ),
          Text(
            '124k honor',
            style: TextStyle(
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
            Navigator.pushNamed(context, '/login');
          },
        ),
        IconButton(
          icon: const Icon(Icons.account_circle_outlined),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Myprofile(
                  user: HoldUser(
                      userId: 'userId',
                      username: 'haririoprivate',
                      honor: 124534,
                      email: 'haririo321@gmail.com'));
            }));
          },
        ),
      ],
    );
  }
}
