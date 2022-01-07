import 'package:flutter/material.dart';
import 'package:mobigic/splash_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobigic',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Splash(),
    );
  }
}
