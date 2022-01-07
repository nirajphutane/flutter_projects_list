import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/example/auth.dart';
import 'package:provider_demo/example/home.dart';
import 'package:provider_demo/example/user.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
          child: GestureDetector(
            child: Text(Provider.of<User>(context, listen: false).username?? 'Login'),
            onTap: () async {
              Provider.of<Auth>(context, listen: false).setLogin(true);
              await Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
              setState(() { });
            },
          ),
        )
    );
  }
}
