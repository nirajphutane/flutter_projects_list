import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Status extends StatefulWidget {

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {

  @override
  Widget build(BuildContext context) {

    String message = Provider.of<String>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Status'),
      ),
      body: Center(
        child: Text(message?? 'No message'),
      )
    );
  }
}
