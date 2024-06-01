import 'package:awekon/core/NavigationItem/BottomNavigationItemClassifier.dart';
import 'package:awekon/core/constants/font_size.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final List<BottomNavigationItemClassifier> items;

  const BottomNavigation({super.key, required this.items});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void profileIconPressed() {
    // Define what happens when the profile icon is pressed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: IconButton(
            icon: Image.asset("assets/icons/Awekon_shadow_icon.png"),
            onPressed: profileIconPressed,
          ),
        ),
        title: Text(
          widget.items[_selectedIndex].label,
          style: const TextStyle(fontSize: FontSize.medium),
        ),
      ),
      body: widget.items[_selectedIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        items: widget.items
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.label,
                ))
            .toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
