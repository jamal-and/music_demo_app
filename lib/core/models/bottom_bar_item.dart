import 'package:flutter/material.dart';

class BottomBarItem {
  final String icon;
  final String label;
  String? routeName; // Name of the route to navigate to
  final Widget?
      screen; // Optional Widget to display when selected. Useful if you don't use named routes

  BottomBarItem({
    required this.icon,
    required this.label,
    this.routeName,
    this.screen,
  });
}
