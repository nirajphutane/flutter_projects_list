import 'package:flutter/material.dart';
import 'playground.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bubbles',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: PlayGround(),
    );
  }
}
