///lib/application/services/greeting_service.dart
import 'package:flutter/foundation.dart';
import 'package:proxyprovider/application/services/user_service.dart';

class GreetingService {
  UserService userService;

  GreetingService({@required this.userService});

  String get greeting => "Hello, ${userService.username}";
}
