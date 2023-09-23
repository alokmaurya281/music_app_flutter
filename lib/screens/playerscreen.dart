import 'package:flutter/material.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/providers/musicplayerprovider.dart';
import 'package:music_app/providers/songprovider.dart';
import 'package:music_app/widgets/bottomnavigation.dart';
import 'package:music_app/widgets/musicplayer.dart';
import 'package:provider/provider.dart';

class PlayerScreen extends StatefulWidget {
  // final Song song;
  final currentIndex;
  // final songs;
  const PlayerScreen({
    super.key,
    // required this.song,
    required this.currentIndex,
    // required this.songs,
  });

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    final musicPlayerProvider = Provider.of<MusicPlayerProvider>(context);
    final songProvider = Provider.of<SongProvider>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              // Color.fromRGBO(122, 81, 226, 1),
              Theme.of(context).colorScheme.primary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 900,
                height: 700,
                child: PageView.builder(
                  controller: PageController(initialPage: widget.currentIndex),
                  scrollDirection: Axis.horizontal,
                  itemCount: songProvider.songs.length,
                  onPageChanged: (index) {
                    musicPlayerProvider.updateCurrentIndex(index);
                  },
                  itemBuilder: (context, index) {
                    return MusicPlayer(currentIndex: index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}
