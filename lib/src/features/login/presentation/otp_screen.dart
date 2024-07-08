import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/features/login/presentation/profil_info.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen(
      {super.key,
      required this.verificationId,
      required this.databaseRepository});
  final String verificationId;

  final DatabaseRepository databaseRepository;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "We have sent an OTP to your phone. Plz verify",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: otpController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(0.25),
                filled: true,
                hintText: "Enter OTP",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none)),
          ),
          const SizedBox(height: 20),
          isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      final cred = PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: otpController.text);

                      await FirebaseAuth.instance.signInWithCredential(cred);

                      Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilInfo(
                              databaseRepository: widget.databaseRepository,
                            ),
                          ));
                    } catch (e) {
                      log(e.toString());
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ))
        ],
      ),
    ));
  }
}
