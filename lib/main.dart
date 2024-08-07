import 'package:flutter/material.dart';
import 'package:music_app/providers/artistprovider.dart';
import 'package:music_app/providers/musicplayerprovider.dart';
import 'package:music_app/providers/songprovider.dart';
import 'package:music_app/providers/themeprovider.dart';
import 'package:music_app/screens/artistscreen.dart';
import 'package:music_app/screens/homescreen.dart';
import 'package:music_app/screens/loginscreen.dart';
import 'package:music_app/screens/signupscreen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

//try 

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ArtistProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SongProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => MusicPlayerProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Permission.notification.request();
    return Builder(builder: (context) {
      final themeProvider = Provider.of<ThemeProvider>(context);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music App',
        themeMode: themeProvider.themeMode,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(84, 19, 138, 1),
            primary: const Color.fromRGBO(122, 81, 226, 1),
            secondary: const Color.fromRGBO(22, 22, 22, 1),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromRGBO(52, 9, 112, 0.408),
            selectedItemColor: Color.fromARGB(255, 255, 255, 255),
            unselectedItemColor: Color.fromARGB(255, 160, 160, 161),
          ),
          textTheme: const TextTheme(
              displayLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
              displayMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              displaySmall: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(84, 19, 138, 1),
            primary: const Color.fromRGBO(22, 22, 22, 1),
            secondary: const Color.fromRGBO(22, 22, 22, 1),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromRGBO(52, 9, 112, 0.408),
            selectedItemColor: Color.fromARGB(255, 255, 255, 255),
            unselectedItemColor: Color.fromARGB(255, 160, 160, 161),
          ),
          textTheme: const TextTheme(
              displayLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
              displayMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              displaySmall: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
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
    });
  }
}
