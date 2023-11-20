import 'package:flutter/material.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/screens/playerscreen.dart';

class SongWidget extends StatefulWidget {
  final Song song;
  // ignore: prefer_typing_uninitialized_variables
  final currentIndex;
  // ignore: prefer_typing_uninitialized_variables
  final songs;
  const SongWidget({
    super.key,
    required this.song,
    required this.currentIndex,
    required this.songs,
  });

  @override
  State<SongWidget> createState() => _SongWidgetState();
}

class _SongWidgetState extends State<SongWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayerScreen(
                    currentIndex: widget.currentIndex,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              width: 90,
              height: 90,
              child: Card(
                elevation: 5,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.network(
                  widget.song.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Flexible(
            child: Text(
              widget.song.title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
