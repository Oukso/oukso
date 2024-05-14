import 'package:oukso/src/data/user.dart';

class Chat {
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  String status;
  bool select = false;
  int id;
  Chat({
    required this.name,
    required this.icon,
    required this.isGroup,
    required this.time,
    required this.currentMessage,
    required this.status,
    required this.select,
    required this.id,
    required List<User> participant,
  });
}
