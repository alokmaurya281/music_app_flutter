import 'package:flutter/material.dart';
import 'package:music_app/providers/songprovider.dart';
import 'package:music_app/widgets/songwidget.dart';
import 'package:provider/provider.dart';

class TopSongsList extends StatefulWidget {
  const TopSongsList({super.key});

  @override
  State<TopSongsList> createState() => _TopSongsListState();
}

class _TopSongsListState extends State<TopSongsList> {
  @override
  Widget build(BuildContext context) {
    final songProvider = Provider.of<SongProvider>(context);
    // final List<Song> songs = songProvider.songs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
        FutureBuilder(
            future: songProvider.fetchSongs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator.adaptive();
              } else {
                return SizedBox(
                  height: 130,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: songProvider.songs.length,
                    itemBuilder: (context, index) {
                      return SongWidget(
                        song: songProvider.songs[index],
                        currentIndex: index,
                        songs: songProvider.songs,
                      );
                    },
                  ),
                );
              }
            })
      ],
    );
  }
}
