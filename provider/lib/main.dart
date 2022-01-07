import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/example/login.dart';
import 'package:provider_demo/example/user.dart';
import 'example/auth.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => Auth(),
        ),
        ProxyProvider<Auth, User>(
          update: (BuildContext context, Auth auth, User user) => User(auth)
        )
      ],
      child: MaterialApp(
        title: '{Provider}',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Login(),
      ),
    );
  }
}

