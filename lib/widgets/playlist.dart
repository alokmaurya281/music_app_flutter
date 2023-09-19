import 'package:flutter/material.dart';
import 'package:music_app/widgets/playlistwidget.dart';

class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return const PlaylistWidget();
            },
          ),
        ],
      ),
    );
  }
}
