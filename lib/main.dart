import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'screens/authentication_screen.dart';
import 'themes/light_theme.dart';
import 'themes/dark_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (lightTheme, darkTheme){
        return MaterialApp(
          title: 'Lecture',
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          home: const AuthenticationScreen(),
        );
      },
    );
  }
}
