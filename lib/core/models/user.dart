class User {
  final String id;
  final String name;
  final String email;
  final String? profilePictureUrl; // Nullable for optional profile picture
  final DateTime? dateOfBirth; // Nullable for optional date of birth
  final List<String>? interests; // Nullable for optional interests

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profilePictureUrl,
    this.dateOfBirth,
    this.interests,
  });

  // Factory constructor for creating a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profilePictureUrl: json['profilePictureUrl'] as String?,
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.tryParse(json['dateOfBirth'] as String)
          : null,
      interests: (json['interests'] as List<dynamic>?)?.cast<String>(),
    );
  }

  // Method for converting a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'interests': interests,
    };
  }

  // Override toString for easy debugging
  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, profilePictureUrl: $profilePictureUrl, dateOfBirth: $dateOfBirth, interests: $interests}';
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profilePictureUrl,
    DateTime? dateOfBirth,
    List<String>? interests,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      interests: interests ?? this.interests,
    );
  }
}
