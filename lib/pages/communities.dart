import 'package:flutter/material.dart';

class Communities extends StatelessWidget {
  const Communities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Center(child: Text("Communities")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //create a community
            Navigator.of(context).pushNamed('/create_community');
          },
          child: const Icon(Icons.add),
        ));
  }
}
