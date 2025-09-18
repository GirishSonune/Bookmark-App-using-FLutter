import 'package:flutter/material.dart';

class EditCollectionPage extends StatefulWidget {
  final String collectionName;
  final Function(String) onCollectionEdited;

  EditCollectionPage({required this.collectionName, required this.onCollectionEdited});

  @override
  _EditCollectionPageState createState() => _EditCollectionPageState();
}

class _EditCollectionPageState extends State<EditCollectionPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.collectionName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveChanges() {
    widget.onCollectionEdited(_controller.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Collection"),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _saveChanges,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: "Collection Name",
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
