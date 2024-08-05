import 'package:flutter/material.dart';
import 'package:oukso/src/features/chat/domain/chat.dart';
import 'package:oukso/src/features/chat/individual_page/individual_page.dart';

class CustemCard extends StatelessWidget {
  const CustemCard({super.key, required this.chat, required this.sourchat});
  final Chat chat;
  final Chat sourchat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualPage(
                      chat: chat,
                      sourchat: sourchat,
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF152B37),
              radius: 30,
              child: Icon(
                chat.isGroup ? Icons.group : Icons.person,
                size: 30,
              ),
            ),
            title: Text(chat.name),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.done_all,
                  size: 18,
                  color: Colors.orange,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  chat.currentMessage,
                  style: const TextStyle(color: Colors.black),
                )
              ],
            ),
            trailing: Text(
              chat.time,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.orange,
            ),
          )
        ],
      ),
    );
  }
}
