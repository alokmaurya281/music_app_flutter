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
        SizedBox(
          height: 130,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: songs.length,
            itemBuilder: (context, index) {
              return SongWidget(song: songs[index]);
            },
          ),
        )
      ],
    );
  }
}
