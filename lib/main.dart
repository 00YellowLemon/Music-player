import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/my_homepage.dart';
import 'themes/theme_provider.dart';
import 'themes/playlist_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PlaylistProvider()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3574504856.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
