import 'dart:math';

import 'package:flutter/material.dart';

class Operation with ChangeNotifier {

  int num = 0;

  void change() {
    for(int n = 0; n < 6; n++){
      num = (num + Random.secure().nextInt(9)) * 10;
    }
    notifyListeners();
  }
}