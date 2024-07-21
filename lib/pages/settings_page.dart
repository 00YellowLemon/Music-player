import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import 'package:provider/provider.dart';
import 'package:myapp/themes/theme_provider.dart';



class Settings extends StatelessWidget{
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dark Mode"),
            CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context,listen: false).isDarkMode,
              onChanged: (value){
                Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
              },
            )
          ]
        )
      )
    );
  }
}
