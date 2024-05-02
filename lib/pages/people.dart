import 'package:flutter/material.dart';
import 'package:reddit_clone/helper/users_fetch.dart';
import 'package:reddit_clone/models/holduser.dart';

class People extends StatefulWidget {
  const People({Key? key}) : super(key: key);

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  List<HoldUser> listOfUsers = [];

  @override
  Widget build(BuildContext context) {
    // returns a list of all users with username and email
    return Scaffold(
      body: FutureBuilder<List<HoldUser>>(
        future: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            listOfUsers = snapshot.data!;
            return ListView.builder(
              itemCount: listOfUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(listOfUsers[index].username),
                  subtitle: Text(listOfUsers[index].email),
                );
              },
            );
          }
        },
      ),
    );
  }
}
