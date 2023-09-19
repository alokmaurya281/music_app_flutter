import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/song_model.dart';

class MusicPlayer extends StatefulWidget {
  final Song song;
  const MusicPlayer({
    super.key,
    required this.song,
  });

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void dispose() {
    audioPlayer.dispose(); // Release resources when widget is removed
    super.dispose();
  }

  void togglePlayer() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play(UrlSource(widget.song.songUrl));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.song.title),
        Text(widget.song.artist),
        ElevatedButton(
          onPressed: togglePlayer,
          child: Text(isPlaying ? 'Pause' : 'Play'),
        ),
      ],
    );
  }
}
