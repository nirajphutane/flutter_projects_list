import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/authentication.dart';
import 'package:provider_demo/message.dart';
import 'package:provider_demo/user.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: GestureDetector(
          child: Text(Provider.of<User>(context, listen: false).name),
          onTap: (){
            Provider.of<Authentication>(context, listen: false).setAuthentication(true);
            Navigator.push(context, MaterialPageRoute(builder: (_) => Message()));
          },
        ),
      )
    );
  }
}
