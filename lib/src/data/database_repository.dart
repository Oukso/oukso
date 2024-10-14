import 'package:oukso/src/features/chat/domain/chat.dart';
import 'package:oukso/src/features/chat/domain/chat_user.dart';
import "package:oukso/src/features/chat/domain/message.dart";

abstract class DatabaseRepository {
  Future<ChatUser?> getChatUser(String id);
  Future<void> addChatUser(ChatUser chatUser);
  Future<List<Chat>> getChatUserChats(ChatUser chatUser);
  Future<List<Message>> getChatMessages(Chat chat);
  Future<void> addMessage(Message message, Chat chat);
}
