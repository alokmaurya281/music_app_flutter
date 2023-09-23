import 'package:flutter/material.dart';

class ArtistSongListWidget extends StatelessWidget {
  const ArtistSongListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(52, 9, 112, 0.408),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Image.asset("assets/images/song2.jpeg"),
        title: Text(
          "Tum hi ho",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        subtitle: Text(
          "Tum hi ho",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        trailing: const Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 34,
        ),
      ),
    );
  }
}
