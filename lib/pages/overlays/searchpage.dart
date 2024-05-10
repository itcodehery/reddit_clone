import 'package:flutter/material.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  SearchpageState createState() => SearchpageState();
}

class SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: const TextField(
          decoration: InputDecoration(
              label: Text('Search for posts, comments and subholds')),
          enabled: true,
          autofocus: true,
        ),
      ),
    );
  }
}
