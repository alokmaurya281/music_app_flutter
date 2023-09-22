class Artist {
  final String id;
  final String name;
  final String imageUrl;
  final String totalSongs;

  Artist({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.totalSongs,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      totalSongs: json['totalSongs'],
    );
  }
}
