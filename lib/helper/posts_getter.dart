import 'package:flutter/material.dart';
import 'package:reddit_clone/models/Post.dart';

class PostGetter {
  List allPosts = [
    TextPost(
      title: 'Bangalore, wake up and go vote',
      content:
          'Atleast after seeing this post, wake your ass up and go vote. If you cannot even do this for your country, what human are you?',
      community: 'bangalore',
      image:
          'https://styles.redditmedia.com/t5_2qhvf/styles/communityIcon_pulpp8crshh91.png?width=256&s=3e8371309022f853b35cede379322dd96a5dd6c9',
      time: TimeOfDay.now(),
      votes: 217,
      comments: 110,
    ),
    TextPost(
      title: 'Bangalore, wake up and go vote',
      content:
          'Atleast after seeing this post, wake your ass up and go vote. If you cannot even do this for your country, what human are you?',
      community: 'bangalore',
      image:
          'https://styles.redditmedia.com/t5_2qhvf/styles/communityIcon_pulpp8crshh91.png?width=256&s=3e8371309022f853b35cede379322dd96a5dd6c9',
      time: TimeOfDay.now(),
      votes: 217,
      comments: 110,
    ),
    TextPost(
      title: 'Bangalore, wake up and go vote',
      content:
          'Atleast after seeing this post, wake your ass up and go vote. If you cannot even do this for your country, what human are you?',
      community: 'bangalore',
      image:
          'https://styles.redditmedia.com/t5_2qhvf/styles/communityIcon_pulpp8crshh91.png?width=256&s=3e8371309022f853b35cede379322dd96a5dd6c9',
      time: TimeOfDay.now(),
      votes: 217,
      comments: 110,
    ),
    ImagePost(
        title:
            'Why do websites that appear as favicons on the desktop application not appear in the mobile application?',
        image:
            "https://preview.redd.it/h1nuawk3hpwc1.jpg?width=418&format=pjpg&auto=webp&s=8969c047b72a124da806a8329bbc1ce5992b48b6",
        community: "ArcBrowser",
        communityImage:
            "https://styles.redditmedia.com/t5_3kbwy/styles/communityIcon_59hsv4xufjgb1.png?width=256&s=06e940f7f903a052488f50dde25b858081914fcf",
        time: TimeOfDay.now(),
        votes: 13,
        comments: 11),
  ];
}
