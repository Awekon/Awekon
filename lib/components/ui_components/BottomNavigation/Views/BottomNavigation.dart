import 'package:awekon/core/NavigationItem/BottomNavigationItemClassifier.dart';
import 'package:awekon/core/constants/font_size.dart';
import 'package:awekon/components/ui_components/SideNavigationBar/Views/SideNavigation.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final List<BottomNavigationItemClassifier> items;

  const BottomNavigation({super.key, required this.items});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          widget.items[_selectedIndex].label,
          style: const TextStyle(fontSize: FontSize.medium),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: const SideNavigationDrawer(),
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
