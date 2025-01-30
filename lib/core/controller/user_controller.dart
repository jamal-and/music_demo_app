import 'package:flutter/material.dart';
import 'package:music_app/core/models/user.dart';

class UserController {
  UserController() {
    debugPrint('User created');
  }
  User currentUser = User(id: 'id', name: 'Kevin', email: 'email@email.com');

  void updateUser({
    String? name,
    String? email,
    String? profilePictureUrl,
    DateTime? dateOfBirth,
    List<String>? interests,
  }) {
    currentUser = currentUser.copyWith(
      name: name,
      email: email,
      profilePictureUrl: profilePictureUrl,
      dateOfBirth: dateOfBirth,
      interests: interests,
    );
  }
}
