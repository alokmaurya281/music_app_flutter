import 'package:flutter/material.dart';
import 'package:music_app/providers/themeprovider.dart';
import 'package:music_app/widgets/bottomnavigation.dart';
import 'package:provider/provider.dart';

class ThemeScreenChanger extends StatefulWidget {
  const ThemeScreenChanger({super.key});

  @override
  State<ThemeScreenChanger> createState() => _ThemeScreenChangerState();
}

class _ThemeScreenChangerState extends State<ThemeScreenChanger> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary,
              // Color.fromRGBO(122, 81, 226, 1),
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/');
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Select Theme',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              RadioListTile<ThemeMode>(
                activeColor: Colors.white,
                title: const Text(
                  'Light Theme',
                  style: TextStyle(color: Colors.white),
                ),
                value: ThemeMode.light,
                groupValue: themeProvider.themeMode,
                onChanged: themeProvider.setTheme,
              ),
              RadioListTile<ThemeMode>(
                activeColor: Colors.white,
                title: const Text(
                  'Dark Theme',
                  style: TextStyle(color: Colors.white),
                ),
                value: ThemeMode.dark,
                groupValue: themeProvider.themeMode,
                onChanged: themeProvider.setTheme,
              ),
              RadioListTile<ThemeMode>(
                activeColor: Colors.white,
                title: const Text(
                  'System Theme',
                  style: TextStyle(color: Colors.white),
                ),
                value: ThemeMode.system,
                groupValue: themeProvider.themeMode,
                onChanged: themeProvider.setTheme,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}
