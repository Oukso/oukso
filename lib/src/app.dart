import 'package:flutter/material.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/data/mock_database.dart';
import 'package:oukso/src/features/login/presintation/login_screen.dart';
import 'package:oukso/src/features/welcome_screen_2/welcome_screen_2.dart';

class App extends StatelessWidget {
 
   const App({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseRepository databaseRepository = MockDatabase();
    return const MaterialApp(
      home: LoginScreen(),
    ) ;
  }
}