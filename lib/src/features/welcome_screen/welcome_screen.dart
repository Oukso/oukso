import 'package:flutter/material.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/features/chat/domain/chat.dart';
import 'package:oukso/src/features/login/presentation/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(
      {super.key, required this.databaseRepository, required this.sourchat});
  final DatabaseRepository databaseRepository;
  final Chat sourchat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF1587B8), Color(0xFF0D3A7F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: GradientRotation(0.5))),
          ),
          Positioned(
              top: 160,
              left: 160,
              child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      image: DecorationImage(
                          image: AssetImage("assets/Logo.png"),
                          fit: BoxFit.cover)))),
          Positioned(
              top: 280,
              left: 100,
              child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(colors: [
                        Color.fromARGB(255, 0, 255, 123),
                        Color.fromARGB(255, 5, 24, 235),
                        Colors.purple
                      ]).createShader(bounds),
                  child: const Text(
                    "Welcome to Oukso",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ))),
          Positioned(
              top: 320,
              left: 100,
              child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(colors: [
                        Color.fromARGB(255, 241, 242, 243),
                        Color.fromARGB(255, 255, 255, 255)
                      ]).createShader(bounds),
                  child: const Text(
                    "Wähle deine Sprache, um loszulegen",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ))),
          Positioned(
              top: 400,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen(
                                          databaseRepository:
                                              databaseRepository,
                                          sourchat: sourchat,
                                        )));
                          },
                          icon: const Icon(
                            Icons.radio_button_checked,
                            color: Color.fromARGB(255, 0, 250, 137),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Deutsch",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "(Gerätsprache)",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.radio_button_unchecked,
                            color: Color.fromARGB(255, 255, 255, 255),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "English",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.radio_button_unchecked,
                            color: Color.fromARGB(255, 254, 254, 254),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Arabisch",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.radio_button_unchecked,
                            color: Color.fromARGB(255, 255, 255, 255),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Französisch",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.radio_button_unchecked,
                            color: Color.fromARGB(255, 255, 255, 255),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Spanisch",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.radio_button_unchecked,
                            color: Color.fromARGB(255, 251, 251, 251),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Japanisch",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
