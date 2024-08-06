import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/features/chat/domain/chat.dart';
import 'package:oukso/src/features/chat/domain/message.dart';

class FirestoreDatabase implements DatabaseRepository {
  final FirebaseFirestore _firebaseFirestore;
  FirestoreDatabase(this._firebaseFirestore);

  @override
  Future<User?> getUser(String id) async {
    DocumentSnapshot doc =
        await _firebaseFirestore.collection('users').doc(id).get();
    if (doc.exists) {
      return User.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<void> addUser(User user) async {
    await _firebaseFirestore.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'email': user.email,
      'displayName': user.displayName,
      'photoURL': user.photoURL,
    });
  }

  @override
  Future<List<Chat>> getUserChats(User user) async {
    final snapshot = await _firebaseFirestore
        .collection('chats')
        .where('userIds', arrayContains: user.uid)
        .get();
    List<Chat> chats = [];
    if (snapshot.docs.isNotEmpty) {
      for (DocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        if (doc.exists && doc.data() != null) {
          chats.add(Chat.fromMap(doc.data()!));
        }
      }
    }
    return chats;
  }

  @override
  Future<List<Message>> getChatMessages(Chat chat) async {
    final snapshot = await _firebaseFirestore
        .collection('chats')
        .doc(chat.id)
        .collection('messages')
        .orderBy('timestamp')
        .get();
    List<Message> messages = [];
    if (snapshot.docs.isNotEmpty) {
      for (DocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        if (doc.exists && doc.data() != null) {
          messages.add(Message.fromMap(doc.data()!));
        }
      }
    }
    return messages;
  }

  @override
  Future<void> addMessage(Message message, Chat chat) async {
    await _firebaseFirestore
        .collection('chats')
        .doc(chat.id)
        .collection('messages')
        .add(message.toMap());
  }
}
