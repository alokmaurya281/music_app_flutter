import 'package:flutter/material.dart';
import 'package:music_app/widgets/artistsonglistwidget.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({super.key});

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary,
              // Color.fromRGBO(122, 81, 226, 1),
              Theme.of(context).colorScheme.primary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Arijit Singh",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          child: const Icon(
                            Icons.more_vert_outlined,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 320,
                height: 300,
                child: Card(
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Image.asset(
                    "assets/images/arijit.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: double.infinity,
              //   child: ListView.builder(
              //     primary: false,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemCount: 30,
              //     itemBuilder: (context, index) {
              //       return ArtistSongListWidget();
              //     },
              //   ),
              // )
              const Column(
                children: [
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                  ArtistSongListWidget(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
