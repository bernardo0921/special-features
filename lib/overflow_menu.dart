import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overflow Menu Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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
                  // Do something for Option 1
                  print('Option 1 selected');
                  break;
                case 'Option 2':
                  // Do something for Option 2
                  print('Option 2 selected');
                  break;
                case 'Option 3':
                  // Do something for Option 3
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
        ],
      ),
      body: Center(
        child: Text('Press the three-dot menu in the top right corner.'),
      ),
    );
  }
}
