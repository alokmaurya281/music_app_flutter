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
  Duration position = const Duration();
  Duration duration = const Duration();

  @override
  void initState() {
    super.initState();
    // isPlaying = true;

    // Listen for changes in audio position and duration
    // var onAudioPositionChanged;
    audioPlayer.onPositionChanged.listen((p) => setState(() => position = p));
    audioPlayer.onDurationChanged.listen((d) => setState(() => duration = d));
  }

  @override
  void dispose() {
    audioPlayer.dispose(); // Release resources when widget is removed
    super.dispose();
  }

  togglePlayer() async {
    try {
      if (isPlaying) {
        await audioPlayer.pause();
      } else {
        await audioPlayer.play(UrlSource(widget.song.songUrl));
      }
      setState(() {
        isPlaying = !isPlaying;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  String formatDuration(Duration d) {
    return d.toString().split('.').first.padLeft(8, "0");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 320,
          height: 300,
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
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (widget.song.title).length > 30
                        ? widget.song.title.substring(0, 30)
                        : widget.song.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    widget.song.artist,
                    style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.reply,
                      size: 22,
                      color: Colors.white60,
                    ),
                  ),
                  GestureDetector(
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.more_horiz,
                        size: 22,
                        color: Colors.white60,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Slider(
          value: position.inSeconds.toDouble(),
          min: 0.0,
          max: duration.inSeconds.toDouble(),
          onChanged: (double value) {
            audioPlayer.seek(Duration(seconds: value.toInt()));
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formatDuration(position),
                style: const TextStyle(color: Colors.white60),
              ),
              Text(
                formatDuration(duration),
                style: const TextStyle(color: Colors.white60),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: const Icon(
                Icons.skip_previous,
                size: 44,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: togglePlayer,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        blurStyle: BlurStyle.outer,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ]),
                child: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.black,
                  size: 44,
                ),
              ),
            ),
            GestureDetector(
              child: const Icon(
                Icons.skip_next,
                size: 44,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    );
  }
}
