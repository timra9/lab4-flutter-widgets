import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

final ValueNotifier<bool> darkMode = ValueNotifier(false);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: darkMode,
      builder: (context, isDark, child) {
        return MaterialApp(
          title: 'Lab 4',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorSchemeSeed: Colors.indigo),
          darkTheme: ThemeData(
            colorSchemeSeed: Colors.indigo,
            brightness: Brightness.dark,
          ),
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: const HomeScreen(),
        );
      },
    );
  }
}
