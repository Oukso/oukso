import 'user.dart';

class Chat {
  
  String id;
  List<User> participant; 

  Chat ({
    required this.id,
    required this.participant,
  });
}