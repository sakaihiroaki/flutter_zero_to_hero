import 'package:flutter/material.dart';
import 'package:my_bookmarks/router.dart';

import 'page/bookmarks_page.dart';

void main() {
  setupRouter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BookmarksPage(),
    );
  }
}
