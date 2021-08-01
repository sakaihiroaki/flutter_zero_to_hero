import 'package:flutter/material.dart';

import '../model/bookmark.dart';
import 'bookmark_grid_item_widget.dart';

class BookmarksGridWidget extends StatelessWidget {
  const BookmarksGridWidget({
    required this.bookmarksList,
    Key? key,
  }) : super(key: key);

  final List<Bookmark> bookmarksList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.5,
          crossAxisCount: 2,
          crossAxisSpacing: 6,
        ),
        itemCount: bookmarksList.length,
        itemBuilder: (BuildContext context, int index) {
          return BookmarkGridItemWidget(
            bookmark: bookmarksList[index],
          );
        },
      ),
    );
  }
}
