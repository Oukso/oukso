/*import 'package:flutter/material.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/features/chat/domain/chat.dart';
import 'package:oukso/src/features/chat/domain/message.dart';
import 'package:oukso/src/features/chat/domain/ChatUser.dart';

class MockDatabase implements DatabaseRepository {
  // Simulierte Datenbank (fake)
  List<ChatUser> ChatUsers = [
    ChatUser(id: "1", ChatUserName: "Med", phoneNumber: "+4918765"),
    ChatUser(id: "2", ChatUserName: "Medou", phoneNumber: "+491876565"),
    ChatUser(id: "3", ChatUserName: "Medouk", phoneNumber: "+4918765987"),
  ];

  Map<String, List<Chat>> ChatUserChats = {
    "1": [
      Chat(
        name: "Oukassou",
        icon: "${const Icon(Icons.person)}",
        isGroup: false,
        time: "8:30",
        currentMessage: "Hi, Mo",
        select: false,
        id: '1',
      ),
      Chat(
        name: "Med",
        icon: "${const Icon(Icons.person)}",
        isGroup: false,
        time: "9:30",
        currentMessage: "Hi, Mo",
        select: false,
        id: '2',
      ),
      Chat(
        name: "Aziz",
        icon: "${const Icon(Icons.person)}",
        isGroup: false,
        time: "10:30",
        currentMessage: "Hi, Mo",
        select: false,
        id: '3',
      ),
      Chat(
        name: "Patchata",
        icon: "${const Icon(Icons.group)}",
        isGroup: true,
        time: "11:00",
        currentMessage: "Hi, Mo",
        select: false,
        id: '4',
      ),
      Chat(
        name: "Batch#5",
        icon: "${const Icon(Icons.group)}",
        isGroup: true,
        time: "11:30",
        currentMessage: "Hi, Mo",
        select: false,
        id: '5',
      ),
      Chat(
        name: "Mum",
        icon: "${const Icon(Icons.person)}",
        isGroup: false,
        time: "21:30",
        currentMessage: "Hi, Mo",
        select: false,
        id: '6',
      )
    ],
  };

  Map<Chat, List<Message>> chatMessages = {};

  @override
  Future<ChatUser?> getChatUser(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    for (ChatUser ChatUser in ChatUsers) {
      if (ChatUser.id == id) {
        return ChatUser;
      }
    }
    return null;
  }

  @override
  Future<List<Chat>> getChatUserChats(ChatUser ChatUser) async {
    await Future.delayed(const Duration(milliseconds: 5));
    // Überprüfe, ob der Benutzer in der Liste der Benutzer vorhanden ist
    if (!ChatUserChats.containsKey(ChatUser.id)) {
      return [];
    }
    return List<Chat>.from(ChatUserChats[ChatUser.id] ?? []);
  }

  @override
  Future<List<Message>> getChatMessages(Chat chat) async {
    await Future.delayed(const Duration(seconds: 2));
    return List<Message>.from(chatMessages[chat] ?? []);
  }

  @override
  Future<void> addMessage(Message message, Chat chat) async {
    await Future.delayed(const Duration(seconds: 2));
    if (chatMessages.containsKey(chat)) {
      chatMessages[chat]?.add(message);
    }
  }
}*/
