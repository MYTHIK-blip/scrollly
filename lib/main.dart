import 'package:flutter/material.dart';
import 'ui/wizard_screen.dart';


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
        child: ElevatedButton(
          child: Text('Start Scrollly Wizard'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WizardScreen()),
            );
          },
        ),
      ),
    );
  }
}
