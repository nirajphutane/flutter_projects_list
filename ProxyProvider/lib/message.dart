import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/models.dart';
import 'package:provider_demo/user.dart';

class Message extends StatefulWidget {

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
      ),
      body: Center(
        child: Text(Provider.of<User>(context).getName()?? 'Something went wrong!'),
      )
    );
  }
}
