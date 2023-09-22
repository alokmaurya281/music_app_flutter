import 'package:flutter/material.dart';
import 'package:music_app/providers/artistprovider.dart';
import 'package:music_app/providers/songprovider.dart';
import 'package:music_app/screens/artistscreen.dart';
import 'package:music_app/screens/homescreen.dart';
import 'package:music_app/screens/loginscreen.dart';
import 'package:music_app/screens/signupscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ArtistProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SongProvider(),
      ),
    ],
    child: const MyApp(),
  ));
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
          primary: const Color.fromRGBO(122, 81, 226, 1),
          secondary: const Color.fromRGBO(22, 22, 22, 1),
        ),
        textTheme: const TextTheme(
            displayLarge: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
            displayMedium: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
            displaySmall: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        // '/': (context) => const PlayerScreen(),

        '/signup': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),
        '/artists': (context) => const ArtistScreen(),

        // '/player': (context) => const PlayerScreen(),
      },
    );
  }
}
