import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oukso/firebase_options.dart';
import 'package:oukso/src/app.dart';
import 'package:oukso/src/data/auth_repository.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/data/firestore_database.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  DatabaseRepository databaseRepository =
      FirestoreDatabase(FirebaseFirestore.instance);
  AuthRepository authRepository = AuthRepository(FirebaseAuth.instance);
  runApp(
    MultiProvider(
      providers: [
        Provider<DatabaseRepository>(
          create: (_) => databaseRepository,
        ),
        Provider<AuthRepository>(
          create: (_) => authRepository,
        ),
      ],
      child: const App(),
    ),
  );
}
