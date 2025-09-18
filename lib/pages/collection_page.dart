import 'package:flutter/material.dart';


class CollectionsPage extends StatefulWidget {
  @override
  _CollectionsPageState createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  List<String> collections = []; // Initialize with empty collections

  void _showAddCollectionDialog() {
    TextEditingController collectionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Column(
            children: [
              Icon(Icons.folder_open, size: 40, color: Colors.black),
              SizedBox(height: 10),
              Text("Add Collection", style: TextStyle(fontSize: 24)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Enter a name for your collection.",
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: 16),
              TextField(
                controller: collectionController,
                decoration: InputDecoration(
                  hintText: "Enter collection name",
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
                if (collectionController.text.isNotEmpty) {
                  setState(() {
                    collections.add(collectionController.text);
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
          'Collections',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: collections.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.collections, size: 100, color: Colors.grey[300]),
                  SizedBox(height: 16),
                  Text(
                    "No Collections",
                    style: TextStyle(fontSize: 24, color: Colors.black54),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Create your first collection to organize your bookmarks",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: collections.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(collections[index]),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCollectionDialog,
        backgroundColor: Colors.purple[100],
        child: Icon(Icons.add, color: Colors.black, size: 32),
      ),
    );
  }
}
