import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Gib deine Telefonnummer ein",
      )),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
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
                            color: Colors.white, fontWeight: FontWeight.w600)),
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
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange)),
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
      )),
    );
  }
}
