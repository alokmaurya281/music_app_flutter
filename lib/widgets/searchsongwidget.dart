import 'package:flutter/material.dart';

class SearchSongWidget extends StatelessWidget {
  const SearchSongWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 50,
      child: TextField(
        cursorColor: Colors.white60,
        style: const TextStyle(color: Colors.white60, fontSize: 14),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white70,
            size: 22,
          ),
          hintText: "Search Song...",
          hintStyle: const TextStyle(color: Colors.white60, fontSize: 14),
          fillColor: const Color.fromRGBO(52, 9, 112, 0.408),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
