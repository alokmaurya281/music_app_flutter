import 'package:flutter/material.dart';

class ArtistSongListWidget extends StatelessWidget {
  const ArtistSongListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(84, 19, 138, 1),
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
        trailing: Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 34,
        ),
      ),
    );
  }
}
