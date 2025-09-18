// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<String> collections = ["fds"];
//   List<String> bookmarks = ["GDG Nagpur | Experience Devfest"];

//   void _addNewCollection() {
//     setState(() {
//       collections.add("New Collection ${collections.length + 1}");
//     });
//   }

//   void _addNewBookmark() {
//     setState(() {
//       bookmarks.add("New Bookmark ${bookmarks.length + 1}");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('GS Bookmarks'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings),
//             onPressed: () {
//               // Settings functionality can go here
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Collections',
//               style: TextStyle(fontSize: 24, color: Colors.white),
//             ),
//             SizedBox(height: 8),
//             Container(
//               height: 100,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   ...collections
//                       .map((collection) => CollectionCard(collection)),
//                   GestureDetector(
//                     onTap: _addNewCollection,
//                     child: Container(
//                       width: 80,
//                       margin: EdgeInsets.symmetric(horizontal: 8),
//                       decoration: BoxDecoration(
//                         color: Colors.green[700],
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: Icon(Icons.add, color: Colors.white, size: 32),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Bookmarks',
//               style: TextStyle(fontSize: 24, color: Colors.white),
//             ),
//             Expanded(
//               child: ListView(
//                 children: [
//                   ...bookmarks.map((bookmark) => BookmarkCard(bookmark)),
//                   GestureDetector(
//                     onTap: _addNewBookmark,
//                     child: Container(
//                       margin: EdgeInsets.symmetric(vertical: 8),
//                       decoration: BoxDecoration(
//                         color: Colors.green[700],
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       height: 100,
//                       child: Center(
//                         child: Icon(Icons.add, color: Colors.white, size: 32),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CollectionCard extends StatelessWidget {
//   final String collectionName;

//   CollectionCard(this.collectionName);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 80,
//       margin: EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         color: Colors.grey[800],
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.folder, color: Colors.white),
//             SizedBox(height: 4),
//             Text(
//               collectionName,
//               style: TextStyle(color: Colors.white),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BookmarkCard extends StatelessWidget {
//   final String bookmarkName;

//   BookmarkCard(this.bookmarkName);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.grey[900],
//         borderRadius: BorderRadius.circular(10),
//       ),
//       height: 100,
//       child: Row(
//         children: [
//           Container(
//             width: 100,
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(10),
//                 bottomLeft: Radius.circular(10),
//               ),
//             ),
//             child: Center(
//               child: Icon(Icons.play_arrow, color: Colors.white, size: 40),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 bookmarkName,
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
