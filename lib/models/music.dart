class Music {
  final int? id;
  final String name;
  final String artist;
  final String album;
  final int year;

  Music({
    this.id,
    required this.name,
    required this.artist,
    required this.album,
    required this.year,
  });

  Music.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        artist = res["artist"],
        album = res["album"],
        year = res["year"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'artist': artist,
      'album': album,
      'year': year,
    };
  }
}
