import 'package:flutter/material.dart';
import 'package:reddit_clone/components/hold_app_bar.dart';

class Inbox extends StatelessWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60), child: HoldAppBar()),
        body: Center(
          child: Text('Inbox'),
        ));
  }
}
