import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/features/chat/domain/chat.dart';
import 'package:oukso/src/features/login/presentation/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(
      {super.key, required this.databaseRepository, required this.sourchat});
  final DatabaseRepository databaseRepository;
  final Chat sourchat;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF1587B8), Color(0xFF0D3A7F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(0.5))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Gib deine Telefonnummer ein",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              TextField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                decoration: InputDecoration(
                    fillColor: Colors.grey.withOpacity(0.25),
                    filled: true,
                    hintText: "Enter Phone",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(height: 20),
              isloading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isloading = true;
                        });

                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: phoneController.text,
                          verificationCompleted: (phoneAuthCredential) {},
                          verificationFailed: (error) {
                            log(error.toString());
                          },
                          codeSent: (verificationId, forceResendingToken) {
                            setState(() {
                              isloading = false;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OTPScreen(
                                          verificationId: verificationId,
                                          databaseRepository:
                                              widget.databaseRepository,
                                          sourchat: widget.sourchat,
                                        )));
                          },
                          codeAutoRetrievalTimeout: (verificationId) {
                            log("Auto Retireval timeout");
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25)))),
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ))
            ],
          ),
        ),
      ]),
    );
  }
}
