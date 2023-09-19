import 'package:music_app/models/song_model.dart';

class SongOperations {
  // getsongs() {
  List<Song> songs = [
    Song(
      title: "Tum hi ho",
      artist: "Arijit Song",
      album: "Sad Songs",
      imageUrl: "assets/images/song2.jpeg",
      songUrl:
          "https://file-examples.com/storage/fe9315700c650841d9ee30d/2017/11/file_example_MP3_5MG.mp3",
      duration: const Duration(minutes: 3, seconds: 30),
    ),
    Song(
      title: "Mai Dhoondhne ko Jamaane me",
      artist: "Arijit Song",
      album: "Sad Songs",
      imageUrl: "assets/images/song3.jpeg",
      songUrl:
          "https://file-examples.com/storage/fe9315700c650841d9ee30d/2017/11/file_example_MP3_5MG.mp3",
      duration: const Duration(minutes: 3, seconds: 30),
    ),
  ];
  // }
}
