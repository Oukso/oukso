import 'package:flutter/material.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/features/chat/domain/chat.dart';
import 'package:oukso/src/features/chat/domain/message.dart';
import 'package:oukso/src/features/chat/domain/user.dart';

class MockDatabase implements DatabaseRepository {
  // Simulierte Datenbank (fake)
  List<User> users = [
    User(id: "1", userName: "Med", phoneNumber: "+4918765"),
    User(id: "2", userName: "Medou", phoneNumber: "+491876565"),
    User(id: "3", userName: "Medouk", phoneNumber: "+4918765987"),
  ];

  Map<String, List<Chat>> userChats = {
    "1": [
      Chat(
        name: "Oukassou",
        icon: "${const Icon(Icons.person)}",
        isGroup: false,
        time: "8:30",
        currentMessage: "Hi, Mo",
      ),
      Chat(
        name: "Med",
        icon: "${const Icon(Icons.person)}",
        isGroup: false,
        time: "9:30",
        currentMessage: "Hi, Mo",
      ),
      Chat(
        name: "Aziz",
        icon: "${const Icon(Icons.person)}",
        isGroup: false,
        time: "10:30",
        currentMessage: "Hi, Mo",
      ),
      Chat(
        name: "Patchata",
        icon: "${const Icon(Icons.group)}",
        isGroup: true,
        time: "11:00",
        currentMessage: "Hi, Mo",
      ),
      Chat(
        name: "Batch#5",
        icon: "${const Icon(Icons.group)}",
        isGroup: true,
        time: "11:30",
        currentMessage: "Hi, Mo",
      ),
      Chat(
        name: "Mum",
        icon: "${const Icon(Icons.person)}",
        isGroup: false,
        time: "21:30",
        currentMessage: "Hi, Mo",
      )
    ],
  };

  Map<Chat, List<Message>> chatMessages = {};

  @override
  User? getUser(String id) {
    for (User user in users) {
      if (user.id == id) {
        return user;
      }
    }
    return null;
  }

  @override
  List<Chat> getUserChats(User user) {
    // Überprüfe, ob der Benutzer in der Liste der Benutzer vorhanden ist
    if (!userChats.containsKey(user.id)) {
      return [];
    }
    return List<Chat>.from(userChats[user.id] ?? []);
  }

  @override
  List<Message> getChatMessages(Chat chat) {
    return List<Message>.from(chatMessages[chat] ?? []);
  }

  @override
  void addMessage(Message message, Chat chat) {
    if (chatMessages.containsKey(chat)) {
      chatMessages[chat]?.add(message);
    }
  }
}
