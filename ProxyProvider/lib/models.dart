import 'dart:math';
import 'package:flutter/material.dart';

class TypeA with ChangeNotifier{
  String value;

  void change(){
    String n = '';
    while(n.length < 10){
      n = n + Random.secure().nextInt(10).toString();
    }
    value = n;
  }
}

class TypeB with ChangeNotifier{
  String value;

  void change(){
    value = String.fromCharCodes(List.generate(10, (index) => Random.secure().nextInt(10) + 66));
    notifyListeners();
  }
}