import 'package:flutter/material.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/features/chat/customs/custom_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.databaseRepository});
  final DatabaseRepository databaseRepository;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final currentUser = widget.databaseRepository.getUser("1");
    final chats = widget.databaseRepository.getUserChats(currentUser!);
    debugPrint(chats.length.toString());
    return Scaffold(
      floatingActionButton: const FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: null,
        child: Icon(
          Icons.chat_bubble,
          color: Colors.purple,
        ),
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF1587B8), Color(0xFF0D3A7F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(0.5))),
        ),
        ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => CustemCard(
            chat: chats[index],
          ),
        ),
      ]),
    );
  }
}
