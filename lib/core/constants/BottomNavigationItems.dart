import 'package:awekon/core/NavigationItem/BottomNavigationItemClassifier.dart';
import 'package:awekon/screens/Explore/Views/Explore.dart';
import 'package:awekon/screens/Glimpse/Views/Glimps.dart';
import 'package:awekon/screens/Home/Views/home.dart';
import 'package:awekon/screens/Library/Views/Library.dart';
import 'package:awekon/screens/Settings/Views/Settings.dart';
import 'package:awekon/screens/Upload/Views/Upload.dart';
import 'package:flutter/material.dart';

const List<Map<String, dynamic>> bottomNavItemsContent = [
  {
    "icon": Icons.home_outlined,
    "label": 'Home',
    "screen": Home(),
  },
  {
    "icon": Icons.explore_outlined,
    "label": 'Explore',
    "screen": Explore(),
  },
  {
    "icon": Icons.add_circle_outline,
    "label": 'Upload',
    "screen": Upload(),
  },
  {
    "icon": Icons.play_circle_outline,
    "label": 'Glimpse',
    "screen": Glimpse(),
  },
  {
    "icon": Icons.local_library_outlined,
    "label": 'Library',
    "screen": Library(),
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
