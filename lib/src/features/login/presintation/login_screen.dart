import 'package:flutter/material.dart';
import 'package:oukso/src/features/login/presintation/profil_info.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF1587B8),
          title: const Text(
            "Gib deine Telefonnummer ein",
            style: TextStyle(color: Colors.orange),
          )),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF1587B8), Color(0xFF0D3A7F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: GradientRotation(0.5))),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 2, 45, 87),
                            style: BorderStyle.solid),
                      ),
                      border: UnderlineInputBorder(),
                      hintText: "Deutschland",
                      labelText: 'Deutschland',
                      labelStyle: TextStyle(
                          color: Color(0xFF0D3A7F),
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 2, 45, 87),
                                  style: BorderStyle.solid),
                            ),
                            border: UnderlineInputBorder(),
                            hintText: "Telefonnummer",
                            labelText: 'Telefonnummer',
                            labelStyle: TextStyle(
                                color: Color(0xFF0D3A7F),
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      flex: 4,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 2, 45, 87),
                                  style: BorderStyle.solid),
                            ),
                            border: UnderlineInputBorder(),
                            hintText: "Telefonnummer",
                            labelText: 'Telefonnummer',
                            labelStyle: TextStyle(
                                color: Color(0xFF0D3A7F),
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 180,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilInfo()));
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange)),
                    child: const Text(
                      "Weiter",
                      style: TextStyle(
                          color: Color.fromARGB(255, 1, 59, 169),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
