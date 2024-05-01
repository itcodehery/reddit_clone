import 'package:flutter/material.dart';
import 'package:reddit_clone/helper/post_options.dart';
import 'package:reddit_clone/models/post.dart';

class TextPost extends StatelessWidget {
  final Post post;

  const TextPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${post.userId} from ${post.subhold}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${post.timestamp.toDate().hour}:${post.timestamp.toDate().minute}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        //show options
                        PostOptions().getOptions();
                      },
                      icon: const Icon(Icons.more_vert)),
                ],
              ),
              const Divider(),
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                post.content,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  getCustomButton(() {}, Icons.mode_comment_outlined,
                      "${post.comments.length}"),
                  const SizedBox(width: 16),
                  getCustomButton(
                      () {}, Icons.arrow_upward, "${post.scorepoints}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton getCustomButton(
      void Function() onPressed, IconData icon, String text) {
    return ElevatedButton(
      style: const ButtonStyle(
        elevation: MaterialStatePropertyAll(0),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 5),
          Text(text == "0" ? "Vote" : text),
        ],
      ),
    );
  }
}
