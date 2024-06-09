import 'package:awekon/components/ui_components/CustomAppBar/CustomSilverAppBar.dart';
import 'package:awekon/components/ui_components/SideNavigationBar/Views/SideNavigation.dart';
import 'package:awekon/core/NavigationItem/BottomNavigationItemClassifier.dart';
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

  Widget appbarTitle = SizedBox(
    height: 35,
    width: 35,
    child: Image.asset(
      "assets/icons/Awekon_shadow_icon.png",
    ),
  );

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
    List<Widget> actions = [
      IconButton(
        icon: const Icon(
          Icons.notifications,
          size: 30,
        ),
        onPressed: () {
          // Handle notification icon press
        },
      ),
      IconButton(
        icon: const Icon(
          Icons.account_circle,
          size: 30,
        ),
        onPressed: () {
          _scaffoldKey.currentState?.openEndDrawer();
        },
      ),
    ];

    List<Widget> tabContents = widget.items.map((item) {
      return SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              CustomSliverAppBar(
                title: appbarTitle,
                actions: actions,
              ),
            ];
          },
          body: item.screen,
        ),
      );
    }).toList();

    return Scaffold(
      key: _scaffoldKey,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: IndexedStack(
          index: _selectedIndex,
          children: tabContents,
        ),
      ),
      endDrawer: const SideNavigationDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: widget.items
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.label,
                ))
            .toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
