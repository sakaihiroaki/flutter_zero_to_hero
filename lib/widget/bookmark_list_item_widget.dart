import 'package:flutter/material.dart';
import 'package:my_bookmarks/router.dart';

import '../model/bookmark.dart';

class BookmarkListItemWidget extends StatelessWidget {
  const BookmarkListItemWidget({
    required this.bookmark,
    Key? key,
  }) : super(key: key);

  final Bookmark bookmark;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        bookmark.title,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(
        bookmark.link,
        style: Theme.of(context).textTheme.subtitle2,
      ),
      trailing: Hero(
        tag: bookmark.link,
        child: const Icon(Icons.star, size: 40),
      ),
      onTap: () => router.navigateTo(
        context,
        'viewBookmarkPage',
        routeSettings: RouteSettings(arguments: bookmark),
      ),
    );
  }
}
