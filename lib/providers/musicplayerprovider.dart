import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/song_model.dart';

class MusicPlayerProvider extends ChangeNotifier {
  List<Song> _playlist = [];
  int _currentIndex = 0;
  bool _isPlaying = false;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration position = const Duration();
  Duration duration = const Duration();

  int get currentIndex => _currentIndex;

  List<Song> get playlist => _playlist;
  bool get isPlaying => _isPlaying;

  updateCurrentIndex(index) {
    _currentIndex = index;
  }

  void playNextTrack(playlist, index) {
    {
      _currentIndex = index + 1;
      // print(index);
      notifyListeners();
    }
  }

  void seek(Duration position) {
    audioPlayer.seek(position);
  }

  void playPreviousTrack() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  void play(url) async {
    _isPlaying = true;
    await audioPlayer.play(UrlSource(url));
    notifyListeners();
  }

  void pause() async {
    await audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  String formatDuration(Duration d) {
    return d.toString().split('.').first.padLeft(8, "0");
  }
}
