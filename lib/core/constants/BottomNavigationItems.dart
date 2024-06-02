import 'package:awekon/core/NavigationItem/BottomNavigationItemClassifier.dart';
import 'package:awekon/screens/Explore/Views/Explore.dart';
import 'package:awekon/screens/Home/Views/home.dart';
import 'package:awekon/screens/Settings/Views/Settings.dart';
import 'package:flutter/material.dart';

const List<Map<String, dynamic>> bottomNavItemsContent = [
  {
    "icon": Icons.home,
    "label": 'Home',
    "screen": Home(),
  },
  {
    "icon": Icons.search,
    "label": 'Explore',
    "screen": Explore(),
  },
  {
    "icon": Icons.settings,
    "label": 'Settings',
    "screen": Settings(),
  }
];

final List<BottomNavigationItemClassifier> bottomNavigationItems =
    bottomNavItemsContent
        .map((item) => BottomNavigationItemClassifier(
              icon: item["icon"] as IconData,
              label: item["label"] as String,
              screen: item["screen"] as Widget,
            ))
        .toList();
