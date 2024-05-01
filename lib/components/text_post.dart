import 'package:flutter/material.dart';
import 'package:reddit_clone/helper/post_options.dart';
import 'package:reddit_clone/models/post.dart';

class TextPost extends StatelessWidget {
  final Post post;

  const TextPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: Card(
        color: const Color.fromARGB(255, 255, 239, 235),
        elevation: 0,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(2),
                  title: Text(
                    post.title,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        //show options
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                children: PostOptions().getOptions(),
                              );
                            });
                      },
                      icon: const Icon(Icons.more_vert)),
                ),
                const Divider(
                  color: Color.fromARGB(255, 244, 191, 175),
                ),
                Text(
                  "u/${post.userId} from h/${post.subhold}",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 160, 44, 9)),
                ),
                Text(
                  "${post.timestamp.toDate().hour}:${post.timestamp.toDate().minute}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  post.content,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    getCustomButton(() {}, Icons.card_giftcard_outlined, ""),
                    const SizedBox(width: 10),
                    getCustomButton(() {}, Icons.share, ''),
                    const Spacer(),
                    getCustomButton(() {}, Icons.mode_comment_outlined,
                        "${post.comments.length}"),
                    const SizedBox(width: 10),
                    getCustomButton(
                        () {}, Icons.arrow_upward, "${post.scorepoints}"),
                  ],
                ),
              ],
            ),
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
