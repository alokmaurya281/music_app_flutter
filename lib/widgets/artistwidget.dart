import 'package:flutter/material.dart';

class ArtistWidget extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String totalTracks;

  const ArtistWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.totalTracks,
  });

  @override
  State<ArtistWidget> createState() => _ArtistWidgetState();
}

class _ArtistWidgetState extends State<ArtistWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/artists');
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Stack(
          children: [
            SizedBox(
              width: 150,
              height: 160,
              child: Card(
                elevation: 5,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.network(
                  // widget.artist.imageUrl,
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 14),
                width: 124,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(106, 105, 105, 0.929)
                      .withOpacity(.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.music_note_rounded,
                            size: 12,
                            color: Colors.white,
                          ),
                          Text(
                            '${widget.totalTracks} tracks',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
