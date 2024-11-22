import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repositories/memory_repository.dart';
import 'data/repositories/repository.dart';
import 'ui/bookmarks/bookmarks.dart';
import 'ui/groceries/groceries.dart';

void main() {
  runApp(
    Provider<Repository>(
      create: (_) => MemoryRepository(), // Injecting the Repository
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Streams Lab',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Streams Lab')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookmarksScreen()),
              ),
              child: Text('Bookmarks'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GroceriesScreen()),
              ),
              child: Text('Groceries'),
            ),
          ],
        ),
      ),
    );
  }
}
