import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart'; // Import the ThemeNotifier
// import 'theme.dart'; // Assuming you have a theme.dart file for custom themes

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          title: 'Overflow Menu Example',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData.dark(), // Define dark theme
          themeMode: themeNotifier.themeMode, // Use the current theme mode
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overflow Menu Example'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (a) {
              // Handle the selected option
              switch (a) {
                case 'Option 1':
                  print('Option 1 selected');
                  break;
                case 'Option 2':
                  print('Option 2 selected');
                  break;
                case 'Option 3':
                  print('Option 3 selected');
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Option 1', 'Option 2', 'Option 3'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              // Toggle the theme when the button is pressed
              Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Press the three-dot menu in the top right corner.'),
      ),
    );
  }
}