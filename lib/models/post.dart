import 'package:flutter/material.dart';

class TextPost {
  final String title;
  final String content;
  final String community;
  final String image;
  final TimeOfDay time;
  final int votes;
  final int comments;

  const TextPost({
    required this.title,
    required this.content,
    required this.community,
    required this.image,
    required this.time,
    required this.votes,
    required this.comments,
  });
}

class ImagePost {
  final String title;
  final String image;
  final String community;
  final String communityImage;
  final TimeOfDay time;
  final int votes;
  final int comments;

  const ImagePost({
    required this.title,
    required this.image,
    required this.community,
    required this.communityImage,
    required this.time,
    required this.votes,
    required this.comments,
  });
}
