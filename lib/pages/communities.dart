import 'package:flutter/material.dart';
import 'package:reddit_clone/components/hold_app_bar.dart';
import 'package:reddit_clone/helper/communities_fetch.dart';
import 'package:reddit_clone/models/subhold.dart';

class Communities extends StatefulWidget {
  const Communities({Key? key}) : super(key: key);

  @override
  State<Communities> createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {
  List<Subhold> listOfSubholds = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60.0), child: HoldAppBar()),
        body: FutureBuilder(
          future: getSubholds(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LinearProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              listOfSubholds = snapshot.data!;
              return ListView.builder(
                itemCount: listOfSubholds.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listOfSubholds[index].subholdName),
                    subtitle: Text(listOfSubholds[index].subholdDescription),
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text("Follow"),
                    ),
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //create a community
            Navigator.of(context).pushNamed('/create_community');
          },
          child: const Icon(Icons.add),
        ));
  }
}
