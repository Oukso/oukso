import 'package:oukso/src/features/chat/domain/chat.dart';
import "package:oukso/src/features/chat/domain/message.dart";
import 'package:oukso/src/features/chat/domain/user.dart';

abstract class DatabaseRepository {
  Future<User?> getUser(String id);
  Future<List<Chat>> getUserChats(User user);
  Future<List<Message>> getChatMessages(Chat chat);
  Future<void> addMessage(Message message, Chat chat);
}
