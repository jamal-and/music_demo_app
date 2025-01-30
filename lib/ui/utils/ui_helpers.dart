import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email?.isEmail ?? false) {
    return null;
  } else {
    return 'Please enter a valid email';
  }
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password is required';
  } else if (password.length < 6) {
    return 'Password must be at least 6 characters';
  } else {
    return null;
  }
}

void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
