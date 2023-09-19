import 'package:flutter/material.dart';
import 'package:music_app/services/song_operations.dart';
import 'package:music_app/widgets/musicplayer.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool isFavorite = false;
  // final List songs = SongOperations()();
  final songs = SongOperations().songs;
  @override
  Widget build(BuildContext context) {
    // print(songs);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(122, 81, 226, 1),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(22, 22, 22, 1),
              Color.fromRGBO(122, 81, 226, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Text(
                        "Tum hi ho song name",
                        style: Theme.of(context).textTheme.displayMedium,
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
                      GestureDetector(
                        child: const Icon(
                          Icons.more_vert_outlined,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 360,
                height: 380,
                child: Card(
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Image.asset(
                    "assets/images/song4.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        "Song Name",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "Singer name",
                        style: TextStyle(color: Colors.white60, fontSize: 14),
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
                        child: const Icon(
                          Icons.more_horiz,
                          size: 22,
                          color: Colors.white60,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: songs.length,
                  itemBuilder: (context, index) {
                    return MusicPlayer(song: songs[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
