import 'package:flutter/material.dart';

class SampleScreen extends StatefulWidget {

  SampleScreen();

  @override
  _SampleScreenState createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagination'),
          centerTitle: true,
        ),
        body: Container()
    );
  }
}
