import 'package:fluro/fluro.dart';
import 'package:my_bookmarks/model/bookmark.dart';
import 'package:my_bookmarks/page/add_bookmark_page.dart';

import 'page/view_bookmark_page.dart';

FluroRouter router = FluroRouter();

final Handler addBookmarkPageHandler = Handler(
  handlerFunc: (context, parameters) => const AddBookmarkPage(),
);
final Handler viewBookmarkPageHandler = Handler(
  handlerFunc: (context, parameters) {
    final args = context!.settings!.arguments! as Bookmark;
    return ViewBookmarkPage(
      bookmark: args,
    );
  },
);

void setupRouter() {
  router
    ..define(
      'addBookmarkPage',
      handler: addBookmarkPageHandler,
      transitionType: TransitionType.fadeIn,
    )
    ..define(
      'viewBookmarkPage',
      handler: viewBookmarkPageHandler,
    );
}
