import 'package:flutter/material.dart';
import 'package:music_app/widgets/bottomnavigation.dart';
import 'package:music_app/widgets/drawer.dart';
import 'package:music_app/widgets/playlistwidget.dart';
import 'package:music_app/widgets/songwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        // toolbarHeight: 50,
        backgroundColor: const Color.fromRGBO(122, 81, 226, 1),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: const CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.sort,
              size: 28,
              color: Colors.white60,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.search,
              color: Colors.white60,
              size: 28,
            ),
          ),
        ],
      ),
      // extendBodyBehindAppBar: false,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(122, 81, 226, 1),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(122, 81, 226, 1),
              Color.fromRGBO(22, 22, 22, 1)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hi Alok,",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: Colors.white),
                ),
                const Text(
                  "What You want to hear today?",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white60),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: TextField(
                    cursorColor: Colors.white60,
                    style: const TextStyle(color: Colors.white60, fontSize: 14),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white70,
                        size: 22,
                      ),
                      hintText: "Search Song...",
                      hintStyle:
                          const TextStyle(color: Colors.white60, fontSize: 14),
                      fillColor: const Color.fromRGBO(52, 9, 112, 0.408),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Expanded(
                    child: Row(
                      children: [
                        PlaylistWidget(),
                        PlaylistWidget(),
                        PlaylistWidget(),
                        PlaylistWidget(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Top Songs",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      GestureDetector(
                        child: const Text(
                          "See more",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SongWidget(),
                        SongWidget(),
                        SongWidget(),
                        SongWidget(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}
