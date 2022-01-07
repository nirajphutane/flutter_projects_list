import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_textfield_dropdown/spinner_popup.dart';

import 'edit_text.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home>{

  int index = 0;
  List items = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 13, 14, 15, 16, 17, 18, 19, 20];
  GlobalKey textKey = GlobalKey();
  GlobalKey iconKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: EditText(
        items: items,
        index: null
      ),
    );
  }
  
}