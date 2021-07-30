import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'themes/light_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const int level = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecture',
      theme: lightTheme,
      home: const HomeScreen(),
    );
  }
}
