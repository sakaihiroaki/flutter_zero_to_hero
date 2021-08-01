import 'package:flutter/material.dart';

import '../model/bookmark.dart';
import '../util/navigation_util.dart';

class BookmarkGridItemWidget extends StatelessWidget {
  const BookmarkGridItemWidget({
    required this.bookmark,
    Key? key,
  }) : super(key: key);

  final Bookmark bookmark;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: InkWell(
          onTap: () => navigatorToViewBoookmarkPage(bookmark, context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bookmark.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 6),
              Text(
                bookmark.link,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(height: 6),
              Hero(
                tag: bookmark.link,
                child: const Icon(Icons.star),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
