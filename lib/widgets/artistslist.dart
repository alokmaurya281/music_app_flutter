import 'package:flutter/material.dart';
import 'package:music_app/models/artist_model.dart';
import 'package:music_app/providers/artistprovider.dart';
import 'package:music_app/widgets/artistwidget.dart';
import 'package:provider/provider.dart';

class ArtistsListWidget extends StatefulWidget {
  const ArtistsListWidget({
    super.key,
  });

  @override
  State<ArtistsListWidget> createState() => _ArtistsListWidgetState();
}

class _ArtistsListWidgetState extends State<ArtistsListWidget> {
  @override
  Widget build(BuildContext context) {
    final artistProvider = Provider.of<ArtistProvider>(context);
    // final List<Artist> artists = artistProvider.artists;
    return FutureBuilder(
      future: artistProvider.fetchArtists(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return Container(
            height: 160,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: artistProvider.artists.length,
              itemBuilder: (context, index) {
                final artist = artistProvider.artists[index];
                return ArtistWidget(
                  imageUrl: artist.imageUrl,
                  name: artist.name,
                  totalTracks: artist.totalSongs,
                );
              },
            ),
          );
        }
        // print(artistProvider.artists);
      },
    );
  }
}
