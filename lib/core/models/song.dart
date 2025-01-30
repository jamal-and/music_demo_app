class Song {
  final String? id;
  final String title;
  final String artist;
  final String? album;
  final int? duration; // Duration in seconds
  final String? imageUrl; // Optional album art URL
  final String? genre; // Optional genre
  final int? year; // Optional release year

  Song({
    this.id,
    required this.title,
    required this.artist,
    this.album,
    this.duration,
    this.imageUrl,
    this.genre,
    this.year,
  });

  // Factory constructor to create a Song from a JSON map
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'] as String?,
      title: json['title'] as String,
      artist: json['artist'] as String,
      album: json['album'] as String?,
      duration: json['duration'] as int?,
      imageUrl: json['imageUrl'] as String?,
      genre: json['genre'] as String?,
      year: json['year'] as int?,
    );
  }

  // Method to convert a Song object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album': album,
      'duration': duration,
      'imageUrl': imageUrl,
      'genre': genre,
      'year': year,
    };
  }

  // Override toString for easy debugging
  @override
  String toString() {
    return 'Song{id: $id, title: $title, artist: $artist, album: $album, duration: $duration, imageUrl: $imageUrl, genre: $genre, year: $year}';
  }
}
