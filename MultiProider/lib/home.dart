import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/Model.dart';
import 'package:provider_demo/status.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Operation operation;

  @override
  Widget build(BuildContext context) {
    // operation = Provider.of<Operation>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<int>(context).toString()),
      ),
      body: Center(
        child: GestureDetector(
          child: Text(Provider.of<Operation>(context).num.toString()),
          onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Status()));
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sync),
        onPressed: () {
          // operation.change();
          Provider.of<Operation>(context, listen: false).change();
        },
      ),
    );
  }
}
