import 'package:flutter/material.dart';

import '../model/bookmark.dart';
import '../router.dart';
import '../widget/bookmark_grid_widget.dart';
import '../widget/bookmark_list_widget.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  bool isGridMode = false;
  final List<Bookmark> bookmarksList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookmarks'),
        actions: [
          IconButton(
            icon: isGridMode
                ? const Icon(
                    Icons.list,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.grid_on,
                    color: Colors.white,
                  ),
            onPressed: () {
              setState(() {
                isGridMode = !isGridMode;
              });
            },
          )
        ],
      ),
      body: isGridMode
          ? BookmarksGridWidget(bookmarksList: bookmarksList)
          : BookmarksListWidget(bookmarksList: bookmarksList),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: () => _onAddBurronPressed(context),
        label: const Text('add'),
      ),
    );
  }

  Future<void> _onAddBurronPressed(BuildContext context) async {
    final dynamic result = await router.navigateTo(
      context,
      'addBookmarkPage',
    );

    if (result != null && result is Bookmark) {
      setState(() {
        bookmarksList.add(result);
      });
    }
  }
}
