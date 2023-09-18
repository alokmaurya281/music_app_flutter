import 'dart:ui';

import 'package:flutter/material.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Color.fromRGBO(22, 22, 22, 1),
      // color: Colors.transparent,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          color: const Color.fromRGBO(122, 81, 226, 1).withOpacity(.5),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedItemColor: Color.fromRGBO(189, 162, 255, 1),
              unselectedItemColor: Color.fromRGBO(125, 72, 250, 1),
              backgroundColor: Color.fromARGB(32, 183, 1, 255).withOpacity(.1),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: "Favorite",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                )
              ]),
        ),
      ),
    );
  }
}
