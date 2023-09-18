import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/homescreen.dart';
import 'package:music_app/screens/playerscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(84, 19, 138, 1),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
          displayMedium: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
        useMaterial3: true,
      ),
      home: const PlayerScreen(),
    );
  }
}
