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
        leadingWidth: 70,
        leading: Row(
          children: [
            const Icon(Icons.arrow_back),
            CircleAvatar(
              backgroundColor: const Color(0xFF152B37),
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
