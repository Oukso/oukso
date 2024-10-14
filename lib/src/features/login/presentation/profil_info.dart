import 'package:flutter/material.dart';
import 'package:oukso/src/features/chat/domain/chat.dart';
import 'package:oukso/src/features/chat/presintation/home_page.dart';

class ProfilInfo extends StatelessWidget {
  const ProfilInfo({super.key, required this.sourchat});

  final Chat sourchat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xFF1587B8),
          title: const Text(
            "Profilinfo",
            style: TextStyle(color: Colors.orange),
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
          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Gib bitte dein Namen ein und lege optinal ein Profilbild fest.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      height: 140,
                      width: 140,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 2, 83, 126),
                        borderRadius: BorderRadius.all(Radius.circular(95)),
                      ),
                      child: const IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.orange,
                            size: 60,
                          )),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        const Flexible(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 2, 45, 87),
                                      style: BorderStyle.solid),
                                ),
                                border: UnderlineInputBorder(),
                                hintText: "Gib hier dein Namen ein.",
                                labelText: 'Gib hier dein Namen ein.',
                                labelStyle: TextStyle(
                                    color: Color(0xFF0D3A7F),
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.emoji_emotions,
                              color: Colors.orange,
                              size: 40,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(
                                      sourchat: sourchat,
                                    )));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25)))),
                      child: const Text(
                        "Weiter",
                        style: TextStyle(
                            color: Color.fromARGB(255, 1, 59, 169),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
