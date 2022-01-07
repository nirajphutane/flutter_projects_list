import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model.dart';
import 'home.dart';
import 'dart:math';

void main() {

  runApp(
    MultiProvider(
      providers: [
        FutureProvider<int>(
          initialData: 01234567,
          create: (_) => getRandomNumber(),
        ),
        StreamProvider(
          initialData: 'ABCDEFG',
          create: (_) => getRandomString(),
        ),
        ChangeNotifierProvider(
          create: (_) => Operation(),
        )
      ],
      child: App(),
    ),
  );
}

Stream<String> getRandomString() async* {
  while(true){
    yield await Future.delayed(Duration(seconds: 2), () {
      return String.fromCharCodes(List.generate(7, (index)=> Random.secure().nextInt(93) + 32));
    });
  }
}

Future<int> getRandomNumber() async {
  await Future.delayed(Duration(seconds: 5));
  int num = 0;
  for(int n = 0; n < 6; n++){
    num = (num + Random.secure().nextInt(9)) * 10;
  }
  return num;
}

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '{Provider}',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Home(),
    );
  }
}

