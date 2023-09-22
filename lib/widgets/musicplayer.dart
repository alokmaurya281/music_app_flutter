import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:music_app/providers/musicplayerprovider.dart';
import 'package:music_app/providers/songprovider.dart';
import 'package:music_app/screens/playerscreen.dart';
import 'package:provider/provider.dart';

class MusicPlayer extends StatefulWidget {
  final currentIndex;
  const MusicPlayer({
    super.key,
    required this.currentIndex,
  });

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  bool isFavorite = false;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    // final iOSInitializationSettings initializationSettingsIOS =
    //     IOSInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      // iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void _showNotification(String title, String body) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails('your channel id', 'your channel name',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false,
            ongoing: true,
            enableVibration: true,
            autoCancel: false

            // Enable play/pause action
            );

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  void cancelNotification() {
    flutterLocalNotificationsPlugin.cancelAll();
  }

  // togglePlayer() async {
  //   try {
  //     if (isPlaying) {
  //       await audioPlayer.pause();
  //     } else {
  //       await audioPlayer.play(UrlSource(widget.song.songUrl));
  //       String songTitle = widget.song.title;
  //       String artist = widget.song.artist;
  //       // String notificationId = widget.song.id;

  //       _showNotification(songTitle, artist);
  //     }
  //     setState(() {
  //       isPlaying = !isPlaying;
  //     });
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final musicPlayerProvider = Provider.of<MusicPlayerProvider>(context);
    final songProvider = Provider.of<SongProvider>(context);
    final songs = songProvider.songs;
    musicPlayerProvider.updateCurrentIndex(widget.currentIndex);
    var index = musicPlayerProvider.currentIndex;
    // print(index);
    var currentSong = songs[index];
    _initializeNotifications();
    void handleNotification() {
      musicPlayerProvider.isPlaying
          ? _showNotification(currentSong.title, currentSong.artist)
          : cancelNotification();
    }

    musicPlayerProvider.audioPlayer.onPositionChanged
        .listen((p) => setState(() => musicPlayerProvider.position = p));
    musicPlayerProvider.audioPlayer.onDurationChanged
        .listen((d) => setState(() => musicPlayerProvider.duration = d));
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/');
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 28,
                color: Colors.white,
              ),
            ),
            Column(
              children: [
                Text(
                  "Now Playing",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    currentSong.title,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite ? isFavorite = false : isFavorite = true;
                    });
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.white,
                    size: 28,
                  ),
                ),
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
          height: 30,
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
            child: Image.network(
              currentSong.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (currentSong.title).length > 30
                        ? currentSong.title.substring(0, 30)
                        : currentSong.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    currentSong.artist,
                    style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.reply,
                      size: 22,
                      color: Colors.white60,
                    ),
                  ),
                  GestureDetector(
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.more_horiz,
                        size: 22,
                        color: Colors.white60,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Slider(
          value: musicPlayerProvider.position.inSeconds.toDouble(),
          min: 0.0,
          max: musicPlayerProvider.duration.inSeconds.toDouble(),
          onChanged: (double value) {
            musicPlayerProvider.audioPlayer
                .seek(Duration(seconds: value.toInt()));
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                musicPlayerProvider
                    .formatDuration(musicPlayerProvider.position),
                style: const TextStyle(color: Colors.white60),
              ),
              Text(
                musicPlayerProvider
                    .formatDuration(musicPlayerProvider.duration),
                style: const TextStyle(color: Colors.white60),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerScreen(
                      currentIndex: widget.currentIndex - 1,
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.skip_previous,
                size: 44,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {
                musicPlayerProvider.isPlaying
                    ? musicPlayerProvider.pause()
                    : musicPlayerProvider.play(currentSong.songUrl);
                handleNotification();
              },
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        blurStyle: BlurStyle.outer,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ]),
                child: Icon(
                  musicPlayerProvider.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: Colors.black,
                  size: 44,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerScreen(
                      currentIndex: widget.currentIndex + 1,
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.skip_next,
                size: 44,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    );
  }
}
