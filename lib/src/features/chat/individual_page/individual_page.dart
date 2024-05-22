import 'package:flutter/material.dart';
import 'package:oukso/src/features/chat/domain/chat.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chat});
  final Chat chat;
  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.video_call,
                color: Colors.white,
              )),
          const IconButton(
              onPressed: null, icon: Icon(Icons.call, color: Colors.white)),
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (value) {
              debugPrint(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(child: Text("data")),
                const PopupMenuItem(child: Text("data")),
                const PopupMenuItem(child: Text("data")),
                const PopupMenuItem(child: Text("data")),
                const PopupMenuItem(child: Text("data"))
              ];
            },
          )
        ],
        backgroundColor: const Color(0xFF152B37),
        leadingWidth: 70,
        leading: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 25,
              child: Icon(
                widget.chat.isGroup ? Icons.group : Icons.person,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
