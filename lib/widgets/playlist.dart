import 'package:flutter/material.dart';
import 'package:music_app/services/artist_operations.dart';
import 'package:music_app/services/song_operations.dart';
import 'package:music_app/widgets/playlistwidget.dart';
import 'package:music_app/widgets/songwidget.dart';

class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    final artists = ArtistOperations().artists;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8, left: 8),
          child: Text(
            "Top Artists",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          height: 160,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: artists.length,
            itemBuilder: (context, index) {
              return PlaylistWidget(artist: artists[index]);
            },
          ),
        ),
      ],
    );
  }
}
