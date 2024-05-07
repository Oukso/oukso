import 'package:oukso/src/features/chat/domain/chat.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/features/chat/domain/messege.dart';
import 'package:oukso/src/features/chat/domain/user.dart';


class MockDatabase implements DatabaseRepository {
List<User> user = [
  User(id: "1", userName: "Med", phoneNumber: "+4918765"),
  User(id: "2", userName: "Medou", phoneNumber: "+491876565"),
  User(id: "3", userName: "Medouk", phoneNumber: "+4918765987"),
  ];


  Map<User, List<Chat>> userChats = {};
Map<Chat, List<Messege>> chatMessages = {};


void initializeUserChats() {
  userChats[user[0]]=[
Chat(id: "1", participant: [user[0],user[1]]),
Chat(id: "1", participant: [user[0],user[2]])

  ];
}
void initializeUserMessege (){

 chatMessages[userChats[user[0]]![0]] = [
  Messege(id: "1", sender: user[0], text: "Hallo, wie war dein Tag?"),
  Messege(id: "2", sender: user[0], text: "Gut, und bei dir")
  ];
}
@override
List<User> getUser (){
  return user;
}

@override
List<Chat> getUserChats(User user) {
  // Überprüfe, ob der Benutzer in der Liste der Benutzer vorhanden ist
  if (!userChats.containsKey(user)) {
    return [];
  }
  return List<Chat>.from(userChats[user] ?? []);
}

  @override
  List<Messege> getChatMessages(Chat chat) {
    return List<Messege>.from(chatMessages[chat] ?? []);
  }

  @override
  void addMessage(Messege message, Chat chat) {
    if (chatMessages.containsKey(chat)) {
      chatMessages[chat]?.add(message);
    }

}
}