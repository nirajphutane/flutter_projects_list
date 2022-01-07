///lib/presentation/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxyprovider/application/services/user_service.dart';
import 'package:proxyprovider/presentation/pages/home_page.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: (){
            _onFormSaved(context);
          },
          child: Text("Go"),
        ),
      ),
    );
  }

  _onFormSaved(BuildContext context) {
    Provider.of<UserService>(context, listen: false).setUser('user.username');
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => HomePage(),
    ));
  }
}
