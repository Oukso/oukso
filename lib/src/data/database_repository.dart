import 'package:oukso/src/features/chat/domain/chat.dart';
import 'package:oukso/src/features/chat/domain/messege.dart';
import 'package:oukso/src/features/chat/domain/user.dart';



abstract class DatabaseRepository {
  List<User> getUser();
  List<Chat> getUserChats(User user);
  List<Messege> getChatMessages(Chat chat);
  void addMessage(Messege message, Chat chat);
}