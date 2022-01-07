import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/authentication.dart';
import 'package:provider_demo/models.dart';
import 'package:provider_demo/user.dart';
import 'home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => Authentication(),
        ),
        ProxyProvider(
          update: (BuildContext context, Authentication authentication, User user) => User(authentication: authentication),
        )
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

