import 'package:provider_demo/authentication.dart';

class User {
  String name;
  Authentication authentication;

  User({this.authentication}){
    _updateUser();
  }

  String getName(){
    return name;
  }

  _updateUser(){
    if(authentication.isAuthenticated == true){
      name = 'Mr. Niraj Patil';
    } else {
      name = 'No User!';
    }
  }
}