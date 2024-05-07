import 'user.dart';

class Messege{
  //Attributen
  String id;
  User sender;
  String text;
  //konstruktor
  Messege({
    required this.id, 
    required this.sender, 
    required this.text,
  });
}