import 'package:flex_color_scheme/flex_color_scheme.dart';
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
      theme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xffe64a19),
          primaryContainer: Color.fromARGB(255, 99, 111, 182),
          secondary: Color(0xff303f9f),
          secondaryContainer: Color(0xff7d7194),
          tertiary: Color(0xff303f9f),
          tertiaryContainer: Color(0xff6444e2),
          appBarColor: Color.fromARGB(255, 19, 94, 200),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: true,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          textButtonRadius: 23.0,
          filledButtonRadius: 9.0,
          elevatedButtonRadius: 16.0,
          outlinedButtonRadius: 11.0,
          outlinedButtonBorderWidth: 1.0,
          outlinedButtonPressedBorderWidth: 1.5,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xff8559f0),
          primaryContainer: Color(0xff283593),
          secondary: Color(0xff9575cd),
          secondaryContainer: Color(0xff502ca7),
          tertiary: Color(0xff7e57c2),
          tertiaryContainer: Color(0xff4433a4),
          appBarColor: Color(0xff502ca7),
          error: Color(0xffcf6679),
        ),
        blendLevel: 23,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 11,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          textButtonRadius: 23.0,
          filledButtonRadius: 9.0,
          elevatedButtonRadius: 16.0,
          outlinedButtonRadius: 11.0,
          outlinedButtonBorderWidth: 1.0,
          outlinedButtonPressedBorderWidth: 1.5,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
