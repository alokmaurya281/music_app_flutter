import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            height: 200,
            child: DrawerHeader(
              // margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              padding: EdgeInsets.zero,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  title: const Text(
                    'Alok Maurya',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: const Text(
                    'user@gmail.com',
                    style: TextStyle(color: Colors.white60),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {},
                  // iconColor: Colors.white,
                  // textColor: Colors.white,
                ),
                ListTile(
                  leading: const Icon(Icons.branding_watermark_sharp),
                  title: const Text('Brands'),
                  onTap: () {},
                  // iconColor: Colors.white,
                  // textColor: Colors.white,
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Contact'),
                  onTap: () {},
                  // iconColor: Colors.white,
                  // textColor: Colors.white,
                ),
                ListTile(
                  leading: const FaIcon(FontAwesomeIcons.circleUser),
                  title: const Text('My Account'),
                  onTap: () {},
                  // iconColor: Colors.white,
                  // textColor: Colors.white,
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.arrowRightFromBracket,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
