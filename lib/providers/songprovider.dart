import 'package:flutter/foundation.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/utils/musicdata.dart';

class SongProvider with ChangeNotifier {
  List<Song> _songs = [];

  List<Song> get songs => _songs;

  Future<void> fetchSongs() async {
    _songs = music.map((json) => Song.fromJson(json)).toList();
  }
}
