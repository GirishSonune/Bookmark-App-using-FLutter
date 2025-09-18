import 'package:bookmarks/pages/setting_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> collections = [];
  List<String> bookmarks = [];

  void _addNewCollection() {
    setState(() {
      collections.add("New Collection ${collections.length + 1}");
    });
  }

  void _addNewBookmark() {
    setState(() {
      bookmarks.add("New Bookmark ${bookmarks.length + 1}");
    });
  }

  void _editCollection(int index, String newName) {
    setState(() {
      collections[index] = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.notifications, color: Colors.black),
          onPressed: () {
            // Notification functionality can go here
          },
        ),
        title: Text(
          'GS bookmarks',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
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
            Text(
              'Collections',
              style: TextStyle(fontSize: 20, color: Colors.black),
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
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Create your first collection to organize your bookmarks",
                              style: TextStyle(color: Colors.black54),
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
                              color: Colors.pink[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                                Icon(Icons.add, color: Colors.black, size: 24),
                          ),
                        ),
                      ],
                    )
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...collections.asMap().entries.map((entry) {
                          int index = entry.key;
                          String collection = entry.value;
                          return CollectionCard(
                            collection,
                            (newName) => _editCollection(index,
                                newName), // Callback to update the collection
                          );
                        }).toList(),
                        GestureDetector(
                          onTap: _addNewCollection,
                          child: Container(
                            width: 80,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.pink[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(Icons.add,
                                  color: Colors.black, size: 32),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(height: 24),
            Text(
              'Bookmarks',
              style: TextStyle(fontSize: 20, color: Colors.black),
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
                            style:
                                TextStyle(fontSize: 24, color: Colors.black54),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "You haven't created any bookmarks yet",
                            style: TextStyle(color: Colors.black54),
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
        onPressed: _addNewBookmark,
        backgroundColor: Colors.purple[100],
        child: Icon(Icons.add, color: Colors.black, size: 32),
      ),
    );
  }
}

class CollectionCard extends StatelessWidget {
  final String collectionName;

  CollectionCard(this.collectionName, void Function(dynamic newName) param1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          collectionName,
          style: TextStyle(color: Colors.black, fontSize: 16),
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
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      height: 80,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            bookmarkName,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
