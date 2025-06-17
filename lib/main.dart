import 'package:flutter/material.dart';

void main() {
  runApp(ScrolllyApp());
}

class ScrolllyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollly',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ScrolllyHome(),
    );
  }
}

class ScrolllyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('📜 Scrollly'),
      ),
      body: Center(
        child: Text(
          'Welcome to Scrollly!\nYour civic forge for templates, planners & mini ebooks.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
