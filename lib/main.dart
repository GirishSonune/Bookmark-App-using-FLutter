import 'package:bookmarks/pages/bookmark_page.dart';
import 'package:bookmarks/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:bookmarks/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'pages/onboding/onboding_screen.dart';
import 'theme/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      // Use MultiProvider for multiple providers
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

enum _SelectedTab { home, favorite, add, search, person }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GS Bookmarks',
      // theme: ThemeData.dark(),
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   primarySwatch: Colors.purple,
      //   scaffoldBackgroundColor: Colors.grey[100],
      // ),
      theme: Provider.of<ThemeProvider>(context).themeData,
      // darkTheme: darkMode,
      home: OnbodingScreen(),
    );
  }
}
