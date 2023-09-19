import 'package:flutter/material.dart';
import 'package:music_app/services/song_operations.dart';
import 'package:music_app/widgets/songwidget.dart';

class TopSongsList extends StatefulWidget {
  const TopSongsList({super.key});

  @override
  State<TopSongsList> createState() => _TopSongsListState();
}

class _TopSongsListState extends State<TopSongsList> {
  final songs = SongOperations().songs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Expanded(
            child: SizedBox(
              height: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemCount: songs.length,
                  //   itemBuilder: (context, index) {
                  //     return SongWidget(song: songs[index]);
                  //   },
                  // ),
                  SongWidget(song: songs[0]),
                  SongWidget(song: songs[0]),
                  SongWidget(song: songs[0]),
                  SongWidget(song: songs[0]),
                  SongWidget(song: songs[0]),
                  SongWidget(song: songs[0]),
                  SongWidget(song: songs[0]),
                  SongWidget(song: songs[1]),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
