import 'package:flutter/material.dart';
import 'package:reddit_clone/helper/post_options.dart';
import 'package:reddit_clone/models/Post.dart';

class TextPostWidget extends StatefulWidget {
  final TextPost post;

  const TextPostWidget({super.key, required this.post});
  @override
  State<TextPostWidget> createState() => _TextPostWidgetState();
}

class _TextPostWidgetState extends State<TextPostWidget> {
  int votes = 0;

  void updateVotes(int change) {
    setState(() {
      votes += change;
    });
  }

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
                      image: NetworkImage(widget.post.image),
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
                const SizedBox(width: 8),
                Text(
                  '${widget.post.time.hour}:${widget.post.time.minute}',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    // opens a bottom sheet
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
            Text(
              widget.post.content,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VoteContainer(votes: votes, onUpdateVotes: updateVotes),
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

class VoteContainer extends StatefulWidget {
  const VoteContainer({
    super.key,
    required this.votes,
    required this.onUpdateVotes,
  });

  final int votes;
  final Function(int) onUpdateVotes;

  @override
  State<VoteContainer> createState() => _VoteContainerState();
}

class _VoteContainerState extends State<VoteContainer> {
  @override
  void initState() {
    super.initState();
  }

  bool isVotedUp = false;
  bool isVotedDown = false;

  @override
  Widget build(BuildContext context) {
    Color colorIsVotedUp = isVotedUp ? Colors.orange.shade700 : Colors.grey;
    Color colorIsVotedDown = isVotedDown ? Colors.blue.shade700 : Colors.grey;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: Row(
        children: [
          ElevatedButton(
              onPressed: () {
                if (isVotedDown == true) {
                  widget.onUpdateVotes(2);
                  isVotedDown = false;
                } else if (!isVotedUp) {
                  widget.onUpdateVotes(1);
                  isVotedUp = true;
                } else {
                  widget.onUpdateVotes(-1);
                  isVotedUp = false;
                }
              },
              style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
                splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
                backgroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              child: Icon(Icons.arrow_upward, color: colorIsVotedUp)),
          Text(widget.votes.toString()),
          ElevatedButton(
              onPressed: () {
                if (isVotedUp == true) {
                  widget.onUpdateVotes(-2);
                  isVotedUp = false;
                } else if (!isVotedDown) {
                  widget.onUpdateVotes(-1);
                  isVotedDown = true;
                } else {
                  widget.onUpdateVotes(1);
                  isVotedDown = false;
                }
              },
              style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
                splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
                backgroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              child: Icon(Icons.arrow_downward, color: colorIsVotedDown)),
        ],
      ),
    );
  }
}
