import 'package:oukso/src/data/user.dart';

class Message {
  String type;
  String message;
  String time;
  Message(
      {required this.message,
      required this.type,
      required this.time,
      required String id,
      required User sender,
      required String text});
}
