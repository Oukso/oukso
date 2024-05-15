import 'package:oukso/src/features/chat/domain/chat.dart';
import "package:oukso/src/features/chat/domain/message.dart";
import 'package:oukso/src/features/chat/domain/user.dart';

abstract class DatabaseRepository {
  List<User> getUser();
  List<Chat> getUserChats(User user);
  List<Message> getChatMessages(Chat chat);
  void addMessage(Message message, Chat chat);
}
