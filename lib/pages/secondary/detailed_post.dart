import 'package:flutter/material.dart';
import 'package:reddit_clone/helper/share_post_options.dart';

class DetailedPost extends StatelessWidget {
  const DetailedPost(
      {Key? key,
      required this.title,
      required this.content,
      required this.username,
      required this.subholdname,
      required this.comments,
      required this.honor})
      : super(key: key);

  final String title;
  final String content;
  final String username;
  final String subholdname;
  final List<dynamic> comments;
  final int honor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "r/$username from h/$subholdname",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 160, 44, 9)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    content,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    margin: const EdgeInsets.all(0),
                    elevation: 0,
                    color: Theme.of(context)
                        .colorScheme
                        .inversePrimary
                        .withAlpha(60),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 10),
                      child: Row(
                        children: [
                          getCustomButton(
                              () {}, Icons.card_giftcard_outlined, ""),
                          const SizedBox(width: 10),
                          getCustomButton(() {
                            showModalBottomSheet(
                                showDragHandle: true,
                                context: context,
                                builder: (context) {
                                  return Column(
                                    children: SharePost().getOptions(),
                                  );
                                });
                          }, Icons.share, ''),
                          const Spacer(),
                          const SizedBox(width: 10),
                          getCustomButton(() {}, Icons.arrow_upward, "$honor"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text("${comments.length} comments"),
            const SizedBox(height: 10),
            SingleChildScrollView(
              child: SizedBox(
                height: double.minPositive,
                child: ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(index.toString()),
                      subtitle: const Text("Yello!"),
                    );
                  },
                ),
              ),
            ),
            const Spacer(),
            Card(
              color: Theme.of(context).colorScheme.inversePrimary.withAlpha(60),
              margin: const EdgeInsets.all(0),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8),
                      label: Row(
                        children: [
                          Icon(Icons.edit_note_outlined),
                          SizedBox(width: 10),
                          Text('Write a comment'),
                        ],
                      )),
                ),
              ),
            )
          ],
        ));
  }

  ElevatedButton getCustomButton(
      void Function() onPressed, IconData icon, String text) {
    return ElevatedButton(
      style: const ButtonStyle(
          elevation: MaterialStatePropertyAll(0),
          padding: MaterialStatePropertyAll(EdgeInsets.zero)),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
          ),
          const SizedBox(width: 5),
          Text(text == "0" ? "Vote" : text),
        ],
      ),
    );
  }
}
