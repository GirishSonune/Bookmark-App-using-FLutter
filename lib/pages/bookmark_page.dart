import 'package:bookmarks/pages/all_bookmark_page.dart';
import 'package:bookmarks/pages/collection_page.dart';
import 'package:flutter/material.dart';

import 'setting_page.dart';

class BookmarksPage extends StatefulWidget {
  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  List<String> collections = [];
  List<String> bookmarks = [];

  void _addNewCollection() {
    setState(() {
      collections.add("New Collection ${collections.length + 1}");
    });
  }

  void _showAddBookmarkDialog() {
    TextEditingController bookmarkController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Column(
            children: [
              Icon(
                Icons.add,
                size: 40,
              ),
              SizedBox(height: 10),
              Text("Add Bookmark", style: TextStyle(fontSize: 24)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Enter a valid link to save as a bookmark.",
                // style: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: 16),
              TextField(
                controller: bookmarkController,
                decoration: InputDecoration(
                  hintText: "Enter bookmark link",
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.primary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Add bookmark and close the dialog
                if (bookmarkController.text.isNotEmpty) {
                  setState(() {
                    bookmarks.add(bookmarkController.text);
                  });
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Add"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:
                  Text("Cancel", style: TextStyle(color: Colors.purple[300])),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.notifications,
          ),
          onPressed: () {
            // Notification functionality can go here
          },
        ),
        title: Text(
          'GS bookmarks',
          // style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Collections',
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollectionsPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 25,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.arrow_forward_ios_rounded, size: 15),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              height: 100,
              child: collections.isEmpty
                  ? Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Create your first collection to organize your bookmarks",
                              // style: TextStyle(color: Colors.black54),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: _addNewCollection,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.add, size: 24),
                          ),
                        ),
                      ],
                    )
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...collections
                            .map((collection) => CollectionCard(collection)),
                        GestureDetector(
                          onTap: _addNewCollection,
                          child: Container(
                            width: 80,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(Icons.add, size: 32),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bookmarks',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllBookmarksPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 25,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.arrow_forward_ios_rounded, size: 15),
                  ),
                ),
              ],
            ),
            Expanded(
              child: bookmarks.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.grid_on,
                              size: 100, color: Colors.grey[300]),
                          SizedBox(height: 16),
                          Text(
                            "No Bookmarks",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "You haven't created any bookmarks yet",
                            // style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      children: bookmarks
                          .map((bookmark) => BookmarkCard(bookmark))
                          .toList(),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddBookmarkDialog,
        backgroundColor: Colors.purple[100],
        child: Icon(Icons.add, size: 32),
      ),
    );
  }
}

class CollectionCard extends StatelessWidget {
  final String collectionName;

  CollectionCard(this.collectionName);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          collectionName,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class BookmarkCard extends StatelessWidget {
  final String bookmarkName;

  BookmarkCard(this.bookmarkName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 80,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            bookmarkName,
            // style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
