import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Image.asset(
                "assets/Logo.png",
                fit: BoxFit.cover,
              )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome Back 👋",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                    const Text("Enter you phone number to continue."),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formKey,
                      child: TextFormField(
                        controller: phoneContoller,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            prefixText: "+49 ",
                            labelText: "Enter you phone number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32))),
                        validator: (value) {
                          if (value!.length != 11) {
                            return "Invalid phone number";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
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
                                            title:
                                                const Text("OTP Verification"),
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
                                                                    .circular(
                                                                        32))),
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
                            foregroundColor: Colors.black),
                        child: const Text("Weiter"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
