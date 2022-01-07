import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/models.dart';
import 'home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TypeA()
        ),
        ChangeNotifierProvider(
          create: (_) => TypeB()
        ),
      ],
      child: MaterialApp(
        title: '{Provider}',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Home(),
      ),
    );
  }
}

