import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          // style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubscriptionTile(),
            Divider(),
            SettingsSection(
              icon: Icons.phone_iphone,
              title: 'Display',
              options: ['Theme', 'Language', 'Font'],
              onTap: (option) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(),
            ),
            Divider(),
            SettingsSection(
              icon: Icons.folder,
              title: 'Manage Your Data',
              options: ['Backup', 'Restore'],
              isProFeature: true,
              onTap: (option) {
                // Handle data management taps
              },
            ),
            Divider(),
            SettingsSection(
              icon: Icons.info,
              title: 'About',
              options: ['Version', 'Contact', 'Developer Message'],
              onTap: (option) {
                // Handle about option taps
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[100]!, Colors.pink[300]!],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.diamond, color: Colors.white, size: 30),
      ),
      title: Text(
        'Subscription',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Subscribe now and unlock all PRO features!'),
      onTap: () {
        // Handle subscription action
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Subscribe'),
            content: Text('Unlock PRO features by subscribing!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Handle subscribe action
                },
                child: Text('Subscribe'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SettingsSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> options;
  final bool isProFeature;
  final Function(String) onTap;

  SettingsSection({
    required this.icon,
    required this.title,
    required this.options,
    this.isProFeature = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Row(
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              if (isProFeature)
                Container(
                  margin: EdgeInsets.only(left: 8),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.pink[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'PRO',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
            ],
          ),
          subtitle: Text(options.join(' • ')),
          onTap: () {
            // Handle section tap (if needed)
          },
        ),
        for (String option in options)
          ListTile(
            title: Text(option),
            onTap: () => onTap(option),
          ),
      ],
    );
  }
}
