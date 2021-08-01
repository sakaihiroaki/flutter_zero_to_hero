import 'package:flutter/material.dart';

import '../model/bookmark.dart';
import '../page/add_bookmark_page.dart';
import '../page/view_bookmark_page.dart';

void navigatorToViewBoookmarkPage(Bookmark bookmark, BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (context) => ViewBookmarkPage(
        bookmark: bookmark,
      ),
    ),
  );
}

Future navigatorToAddBoookmarkPage(BuildContext context) {
  return Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (context) => const AddBookmarkPage(),
    ),
  );
}
