import 'package:flutter/foundation.dart';
import 'package:music_app/models/artist_model.dart';
import 'package:music_app/utils/artistsdata.dart';

class ArtistProvider with ChangeNotifier {
  List<Artist> _artists = [];

  List<Artist> get artists => _artists;

  Future<void> fetchArtists() async {
    _artists = artistsJsonData.map((json) => Artist.fromJson(json)).toList();
  }
}
