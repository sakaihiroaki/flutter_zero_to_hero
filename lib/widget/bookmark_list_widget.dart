import 'package:flutter/material.dart';

import '../model/bookmark.dart';
import 'bookmark_list_item_widget.dart';

class BookmarksListWidget extends StatelessWidget {
  const BookmarksListWidget({
    required this.bookmarksList,
    Key? key,
  }) : super(key: key);

  final List<Bookmark> bookmarksList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ListView.builder(
        itemCount: bookmarksList.length,
        itemBuilder: (BuildContext context, int index) {
          return BookmarkListItemWidget(
            bookmark: bookmarksList[index],
          );
        },
      ),
    );
  }
}
