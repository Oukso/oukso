import 'package:oukso/src/data/user.dart';
import 'package:oukso/src/features/chat/domain/chat.dart';
import "package:oukso/src/features/chat/domain/message.dart";

abstract class DatabaseRepository {
  List<User> getUser();
  List<Chat> getUserChats(User user);
  List<Message> getChatMessages(Chat chat);
  void addMessage(Message message, Chat chat);
}
