import 'package:flutter/material.dart';
import 'package:music_app/services/song_operations.dart';
import 'package:music_app/widgets/bottomnavigation.dart';
import 'package:music_app/widgets/drawer.dart';
import 'package:music_app/widgets/artists.dart';
import 'package:music_app/widgets/artistwidget.dart';
import 'package:music_app/widgets/searchsongwidget.dart';
import 'package:music_app/widgets/songwidget.dart';
import 'package:music_app/widgets/topsongslist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final songs = SongOperations().songs;
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
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(122, 81, 226, 1),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.secondary
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi Alok,",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: Colors.white),
                ),
                Text(
                  "What You want to hear today?",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 50,
                ),
                SearchSongWidget(),
                SizedBox(
                  height: 20,
                ),
                ArtistList(),
                SizedBox(
                  height: 30,
                ),
                TopSongsList(),
                SizedBox(
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
