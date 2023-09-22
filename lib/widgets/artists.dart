import 'package:flutter/material.dart';
import 'package:music_app/widgets/artistslist.dart';

class ArtistList extends StatefulWidget {
  const ArtistList({
    super.key,
  });

  @override
  State<ArtistList> createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8, left: 8),
          child: Text(
            "Top Artists",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        ArtistsListWidget(),
      ],
    );
  }
}
