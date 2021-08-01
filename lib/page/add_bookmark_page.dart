import 'package:flutter/material.dart';
import 'package:my_bookmarks/model/bookmark.dart';

class AddBookmarkPage extends StatefulWidget {
  const AddBookmarkPage({Key? key}) : super(key: key);

  @override
  _AddBookmarkPageState createState() => _AddBookmarkPageState();
}

class _AddBookmarkPageState extends State<AddBookmarkPage> {
  final _titleTextController = TextEditingController();
  final _linkTextController = TextEditingController();
  final _linkFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add a new bookmark'),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) => FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            final title = _titleTextController.text;
            final link = _linkTextController.text;
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            if (isInputValid(title, link)) {
              Navigator.pop(
                context,
                Bookmark(title, link),
              );
            } else {
              showInputError(
                context,
                title,
                link,
              );
            }
          },
          child: const Icon(Icons.check),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              // autofocus: true,
              controller: _titleTextController,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (textInput) {
                FocusScope.of(context).requestFocus(_linkFocusNode);
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.title),
                labelText: 'Title',
                hintText: 'Title of the bookmark',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _linkTextController,
              focusNode: _linkFocusNode,
              decoration: const InputDecoration(
                icon: Icon(Icons.link),
                labelText: 'URL',
                hintText: 'Webpage link',
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _linkTextController.dispose();
    _linkFocusNode.dispose();
    super.dispose();
  }

  bool isInputValid(String title, String link) {
    return title.isNotEmpty && link.isNotEmpty;
  }

  void showInputError(BuildContext context, String title, String link) {
    if (title.isEmpty) {
      showSnackBar(context, 'title is Empty');
    } else if (link.isEmpty) {
      showSnackBar(context, 'link is Empty');
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
