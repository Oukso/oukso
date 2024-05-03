import 'package:oukso/src/data/chat.dart';
import 'package:oukso/src/data/messege.dart';
import 'package:oukso/src/data/user.dart';



abstract class DatabaseRepository {
  List<User> getUser();
  List<Chat> getUserChats(User user);
  List<Messege> getChatMessages(Chat chat);
  void addMessage(Messege message, Chat chat);
}