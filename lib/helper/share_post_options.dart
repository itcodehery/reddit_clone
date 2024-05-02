import 'package:flutter/material.dart';

class SharePost {
  final Map<IconData, String> shareOptions = {
    Icons.copy_rounded: 'Copy Link',
    Icons.facebook_outlined: 'Share on Facebook',
  };

  List<Widget> getOptions() {
    List<Widget> optionWidgets = [];
    optionWidgets.add(
      const ListTile(
        title: Text(
          'Share Post',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    for (var option in shareOptions.entries) {
      optionWidgets.add(
        ListTile(
          leading: Icon(option.key),
          title: Text(option.value),
          onTap: () {
            //handle option
          },
        ),
      );
    }
    return optionWidgets;
  }
}
