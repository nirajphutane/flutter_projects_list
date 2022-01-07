import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/example/user.dart';
import 'auth.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: (){
        Provider.of<Auth>(context, listen: false).setLogin(false);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Text(Provider.of<User>(context).getUserName),
        )
      ),
    );
  }
}
