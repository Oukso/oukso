import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oukso/firebase_options.dart';
import 'package:oukso/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}
