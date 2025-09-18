import 'package:flutter/material.dart';


class NewCollectionPage extends StatefulWidget {
  @override
  _NewCollectionPageState createState() => _NewCollectionPageState();
}

class _NewCollectionPageState extends State<NewCollectionPage> {
  TextEditingController _collectionNameController = TextEditingController();

  void _saveCollection() {
    String collectionName = _collectionNameController.text;
    if (collectionName.isNotEmpty) {
      // Save the collection to a list or database as required
      print("Collection saved: $collectionName");
      Navigator.of(context).pop(); // Navigate back after saving
    } else {
      // Show a warning or an error message if needed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Collection name cannot be empty."),
        ),
      );
    }
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
            Navigator.of(context).pop(); // Navigate back
          },
        ),
        title: Text(
          'New Collection',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: Colors.black),
            onPressed: _saveCollection, // Save collection on pressing check
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Icon(Icons.collections, size: 100, color: Colors.grey[300]),
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
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _collectionNameController,
              decoration: InputDecoration(
                hintText: "Collection name",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
