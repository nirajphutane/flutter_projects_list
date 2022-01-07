import 'dart:math';
import 'package:provider_demo/example/auth.dart';

class User{
  Auth auth;
  String username;

  User(this.auth);

  String get getUserName {
    if(auth.isLogin == true){
      username = getRandomString();
    } else {
      username = 'No User Found!';
    }
    return username;
  }

  String getRandomString(){
    return String.fromCharCodes(List.generate(7, (index)=> Random.secure().nextInt(93) + 32));
  }
}