import 'package:flutter/material.dart';

class PostOptions {
  Map<IconData, String> options = {
    Icons.save: 'Save',
    Icons.hide_image_outlined: 'Hide',
    Icons.flag: 'Report',
    Icons.block_outlined: 'Block Account',
    Icons.copy: 'Copy text',
    Icons.share: 'Crosspost to community',
    Icons.download_outlined: 'Download',
  };

  List<Widget> getOptions() {
    var options = PostOptions().options;
    List<Widget> optionWidgets = [];
    optionWidgets.add(
      const ListTile(
        title: Text(
          'Post Actions',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    for (var option in options.entries) {
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
