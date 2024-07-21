import 'package:flutter/material.dart';
import 'package:myapp/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1398337798.
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            DrawerHeader(
                child: Center(
                    child: Icon(
              Icons.music_note,
              size: 40,
              color: Theme.of(context).colorScheme.inversePrimary,
            ))),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 25.0),
              child: ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 25.0),
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Settings(),
                      ));
                },
              ),
            )
          ],
        ));
  }
}
