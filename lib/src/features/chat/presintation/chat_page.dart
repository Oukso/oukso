import 'package:flutter/material.dart';
import 'package:oukso/src/features/customs/custom_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
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
        ListView(
          children: const [
            CustemCard(),
            CustemCard(),
            CustemCard(),
            CustemCard(),
            CustemCard(),
            CustemCard(),
            CustemCard(),
          ],
        ),
      ]),
    );
  }
}
