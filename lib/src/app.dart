import 'package:flutter/material.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/data/mock_database.dart';
import 'package:oukso/src/features/splash_screen/presentation/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseRepository databaseRepository = MockDatabase();
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: const Color(0xFF152B37),
      ),
      home: const SplashScreen(),
    );
  }
}
