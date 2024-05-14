import 'package:flutter/material.dart';

class CustemCard extends StatelessWidget {
  const CustemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 30,
          ),
          title: Text("Oukso"),
          subtitle: Row(
            children: [
              Icon(
                Icons.done_all,
                size: 18,
                color: Colors.orange,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Hi Oukso",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          trailing: Text(
            "09:00",
            style: TextStyle(color: Colors.black),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Divider(
            thickness: 0.5,
          ),
        )
      ],
    );
  }
}
