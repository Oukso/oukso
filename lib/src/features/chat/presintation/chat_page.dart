import 'package:flutter/material.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/features/chat/customs/custom_card.dart';
import 'package:oukso/src/features/chat/domain/chat.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.sourchat});

  final Chat sourchat;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Future<List<Chat>> getChat() async {
    final currentChatUser =
        await context.read<DatabaseRepository>().getChatUser("1");
    final chats = await context
        .read<DatabaseRepository>()
        .getChatUserChats(currentChatUser!);

    return chats;
  }

  @override
  Widget build(BuildContext context) {
    /*final currentChatUser = widget.databaseRepository.getChatUser("1");
    final chats = widget.databaseRepository.getChatUserChats(currentChatUser!);
    debugPrint(chats.length.toString());*/
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
        FutureBuilder(
          future: getChat(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              // FALL: Future ist komplett und hat Daten!

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => CustemCard(
                  chat: snapshot.data![index],
                  sourchat: widget.sourchat,
                ),
              );
            } else if (snapshot.connectionState != ConnectionState.done) {
              // FALL: Sind noch im Ladezustand
              return const Center(child: CircularProgressIndicator());
            } else {
              // FALL: Es gab nen Fehler
              return const Icon(Icons.error);
            }
          },
        ),
      ]),
    );
  }
}
