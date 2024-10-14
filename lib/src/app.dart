import 'package:flutter/material.dart';
import 'package:oukso/src/data/auth_repository.dart';
import 'package:oukso/src/data/database_repository.dart';
import 'package:oukso/src/features/chat/domain/chat.dart';
import 'package:oukso/src/features/splash_screen/presentation/splash_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Chat sourchat = Chat(
        name: "Oukassou",
        icon: "${const Icon(Icons.person)}",
        isGroup: false,
        time: "8:30",
        currentMessage: "Hi, Mo",
        select: false,
        id: "1");
    return StreamBuilder(
        stream: context.read<AuthRepository>().authStateChanges(),
        builder: (context, snapshot) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: "OpenSans",
              primaryColor: const Color(0xFF152B37),
            ),
            home: SplashScreen(
              databaseRepository:
                  Provider.of<DatabaseRepository>(context, listen: false),
              sourchat: sourchat,
            ),
          );
        });
  }
}
