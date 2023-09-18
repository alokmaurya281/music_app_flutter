import 'package:flutter/material.dart';

class PlaylistWidget extends StatefulWidget {
  const PlaylistWidget({super.key});

  @override
  State<PlaylistWidget> createState() => _PlaylistWidgetState();
}

class _PlaylistWidgetState extends State<PlaylistWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
            child: Image.asset(
              "assets/images/song4.jpeg",
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
              color: const Color.fromRGBO(106, 105, 105, 0.929).withOpacity(.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Arijit Singh",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.music_note_rounded,
                        size: 12,
                        color: Colors.white,
                      ),
                      Text(
                        "100 tracks",
                        style: TextStyle(
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
    );
  }
}
