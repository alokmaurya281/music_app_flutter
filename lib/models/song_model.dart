class Song {
  String id;
  String title;
  String artist;
  // String album;
  String imageUrl;
  String songUrl;
  // Duration duration;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    // required this.album,
    required this.imageUrl,
    required this.songUrl,
    // required this.duration,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      title: json['title'],
      imageUrl: json['artwork'],
      artist: json['artist'],
      songUrl: json['url'],
    );
  }
}
