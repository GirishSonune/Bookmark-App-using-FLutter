import 'package:flutter/material.dart';

class AllBookmarksPage extends StatefulWidget {
  @override
  _AllBookmarksPageState createState() => _AllBookmarksPageState();
}

class _AllBookmarksPageState extends State<AllBookmarksPage> {
  List<String> bookmarks = []; // Initialize with empty bookmarks

  void _showAddBookmarkDialog() {
    TextEditingController bookmarkController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Column(
            children: [
              Icon(Icons.add, size: 40, color: Colors.black),
              SizedBox(height: 10),
              Text("Add Bookmark", style: TextStyle(fontSize: 24)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Enter a valid link to save as a bookmark.",
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: 16),
              TextField(
                controller: bookmarkController,
                decoration: InputDecoration(
                  hintText: "Enter bookmark link",
                  filled: true,
                  fillColor: Colors.grey[200],
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
                if (bookmarkController.text.isNotEmpty) {
                  setState(() {
                    bookmarks.add(bookmarkController.text);
                  });
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
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
              child: Text("Cancel", style: TextStyle(color: Colors.purple)),
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
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(); // Navigates back
          },
        ),
        title: Text(
          'All Bookmarks',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Search functionality can go here
            },
          ),
        ],
      ),
      body: bookmarks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.grid_on, size: 100, color: Colors.grey[300]),
                  SizedBox(height: 16),
                  Text(
                    "No Bookmarks",
                    style: TextStyle(fontSize: 24, color: Colors.black54),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "You haven't created any bookmarks yet",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(bookmarks[index]),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddBookmarkDialog,
        backgroundColor: Colors.purple[100],
        child: Icon(Icons.add, color: Colors.black, size: 32),
      ),
    );
  }
}
