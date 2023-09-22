import 'package:flutter/material.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/widgets/bottomnavigation.dart';
import 'package:music_app/widgets/musicplayer.dart';

class PlayerScreen extends StatefulWidget {
  // final Map<String, dynamic> song;
  final Song song;
  const PlayerScreen({
    super.key,
    required this.song,
  });

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    // print(songs);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(122, 81, 226, 1),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(122, 81, 226, 1),
              Color.fromRGBO(22, 22, 22, 1),
              // Color.fromRGBO(122, 81, 226, 1),
              Color.fromRGBO(22, 22, 22, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Now Playing",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          widget.song.title,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite ? isFavorite = false : isFavorite = true;
                          });
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.white,
                          size: 28,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          child: const Icon(
                            Icons.more_vert_outlined,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              MusicPlayer(
                song: widget.song,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}
