import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/features/welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.databaseRepository});
  final DatabaseRepository databaseRepository;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WelcomeScreen(
                    databaseRepository: widget.databaseRepository,
                  )));
    });
  }

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
              top: 355,
              left: 125,
              child: Container(
                  height: 165,
                  width: 165,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(55)),
                      image: DecorationImage(
                          image: AssetImage("assets/Logo.png"),
                          fit: BoxFit.cover)))),
          Positioned(
              top: 555,
              left: 100,
              child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(colors: [
                        Color.fromARGB(255, 1, 173, 84),
                        Color.fromARGB(255, 5, 24, 235),
                        Colors.purple
                      ]).createShader(bounds),
                  child: const Text(
                    "Welcome to Oukso",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  )))
        ],
      ),
    );
  }
}
