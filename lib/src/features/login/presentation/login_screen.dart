import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:oukso/src/data/auth_repository.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/features/login/presentation/profil_info.dart';
import 'package:telephony/telephony.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.databaseRepository});
  final DatabaseRepository databaseRepository;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  final Telephony telephony = Telephony.instance;

  TextEditingController phoneContoller = TextEditingController();
  TextEditingController otpContoller = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();

  void listenToIncomingSMS(BuildContext context) {
    debugPrint("Listening to sms.");
    telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          // Handle message
          debugPrint("sms received : ${message.body}");
          // verify if we are reading the correct sms or not

          if (message.body!.contains("phone-auth-15bdb")) {
            String otpCode = message.body!.substring(0, 6);
            setState(() {
              otpContoller.text = otpCode;
              // wait for 1 sec and then press handle submit
              Future.delayed(const Duration(seconds: 1), () {
                handleSubmit(context);
              });
            });
          }
        },
        listenInBackground: false);
  }

// handle after otp is submitted
  void handleSubmit(BuildContext context) {
    if (formKey1.currentState!.validate()) {
      AuthService.loginWithOtp(otp: otpContoller.text).then((value) {
        if (value == "Success") {
          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfilInfo(
                        databaseRepository: widget.databaseRepository,
                      )));
        } else {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              value,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
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
                Form(
                  key: formKey,
                  child: IntlPhoneField(
                    controller: phoneContoller,
                    decoration: const InputDecoration(
                        labelText: "Land",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )),
                    initialCountryCode: "DE",
                    onChanged: (phone) {
                      debugPrint(phone.completeNumber);
                    },
                  ),
                ),
                const SizedBox(
                  height: 180,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        AuthService.sentOtp(
                            phone: phoneContoller.text,
                            errorStep: () => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                    "Error in sending OTP",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                )),
                            nextStep: () {
                              // start lisenting for otp
                              listenToIncomingSMS(context);
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text("OTP Verification"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Enter 6 digit OTP"),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Form(
                                              key: formKey1,
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: otpContoller,
                                                decoration: InputDecoration(
                                                    labelText:
                                                        "Enter you phone number",
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32))),
                                                validator: (value) {
                                                  if (value!.length != 6) {
                                                    return "Invalid OTP";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  handleSubmit(context),
                                              child: const Text("Submit"))
                                        ],
                                      ));
                            });
                      }
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
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
