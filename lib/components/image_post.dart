import 'package:flutter/material.dart';
import 'package:reddit_clone/helper/post_options.dart';
import 'package:reddit_clone/models/Post.dart';

class ImagePostWidget extends StatefulWidget {
  const ImagePostWidget({super.key, required this.post});

  final ImagePost post;

  @override
  State<ImagePostWidget> createState() => _ImagePostWidgetState();
}

class _ImagePostWidgetState extends State<ImagePostWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.post.communityImage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'r/${widget.post.community}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        elevation: 3,
                        builder: (BuildContext context) {
                          return SizedBox(
                              height: 410,
                              child: ListView(
                                children: PostOptions().getOptions(),
                              ));
                        });
                  },
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
            Text(
              widget.post.title,
              style: const TextStyle(
                fontSize: 20,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.post.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VoteContainer(votes: widget.post.votes),
                CommentButton(comments: widget.post.comments),
                IconButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  icon: const Icon(Icons.share_outlined),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CommentButton extends StatelessWidget {
  const CommentButton({
    super.key,
    required this.comments,
  });

  final int comments;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white),
        elevation: MaterialStatePropertyAll(0),
        padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
      ),
      child: Row(
        children: [
          const Icon(Icons.comment_outlined),
          const SizedBox(width: 4),
          Text(comments.toString()),
        ],
      ),
    );
  }
}

class VoteContainer extends StatelessWidget {
  const VoteContainer({
    super.key,
    required this.votes,
  });

  final int votes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: Row(
        children: [
          ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
                splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
                backgroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              child: const Icon(Icons.arrow_upward)),
          Text(votes.toString()),
          ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
                splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
                backgroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              child: const Icon(Icons.arrow_downward)),
        ],
      ),
    );
  }
}
