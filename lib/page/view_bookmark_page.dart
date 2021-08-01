import 'package:flutter/material.dart';

import '../model/bookmark.dart';
import '../widget/view_web_page_widget.dart';

class ViewBookmarkPage extends StatelessWidget {
  const ViewBookmarkPage({
    Key? key,
    required this.bookmark,
  }) : super(key: key);

  final Bookmark bookmark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookmark.title),
        actions: [
          Hero(
            tag: bookmark.link,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.star),
            ),
          )
        ],
      ),
      body: ViewWebPageWidget(url: bookmark.link),
    );
  }
}
