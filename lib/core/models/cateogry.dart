class SongCateogry {
  final String? id;
  final String name;
  final String imageUrl; // Image URL is now required
  final String? description; // Optional description
  final String?
      parentSongCateogryId; // Optional parent category ID for hierarchical categories

  SongCateogry({
    this.id,
    required this.name,
    required this.imageUrl,
    this.description,
    this.parentSongCateogryId,
  });

  // Factory constructor for creating a SongCateogry from a JSON map
  factory SongCateogry.fromJson(Map<String, dynamic> json) {
    return SongCateogry(
      id: json['id'] as String?,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String?,
      parentSongCateogryId: json['parentSongCateogryId'] as String?,
    );
  }

  // Method for converting a SongCateogry object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'parentSongCateogryId': parentSongCateogryId,
    };
  }

  @override
  String toString() {
    return 'SongCateogry{id: $id, name: $name, imageUrl: $imageUrl, description: $description, parentSongCateogryId: $parentSongCateogryId}';
  }
}
