import 'package:flutter/material.dart';

class BottomNavigationItemClassifier {
  final IconData icon;
  final String label;
  final Widget screen;

  BottomNavigationItemClassifier({
    required this.icon,
    required this.label,
    required this.screen,
  });
}
