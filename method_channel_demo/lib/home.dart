import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static const platform = const MethodChannel('flutter.native/communication');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text('Hi, I am Flutter. \nTab to go Android.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.orange),
          ),
          onTap: () async {
            try {
              await platform.invokeMethod('FromAndroid');
            } on PlatformException catch (e) {
              print('Error:- '+e.toString());
            }
          },
        ),
      ),
    );
  }
}
