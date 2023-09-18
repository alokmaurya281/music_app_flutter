import 'package:flutter/material.dart';

class SongWidget extends StatefulWidget {
  const SongWidget({super.key});

  @override
  State<SongWidget> createState() => _SongWidgetState();
}

class _SongWidgetState extends State<SongWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          width: 90,
          height: 90,
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
        const Text(
          "Tum hi ho",
          style: TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
