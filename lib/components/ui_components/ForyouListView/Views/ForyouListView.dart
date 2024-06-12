import 'package:flutter/material.dart';

class ForYouListView extends StatefulWidget {
  const ForYouListView({super.key});

  @override
  _ForYouListViewState createState() => _ForYouListViewState();
}

class _ForYouListViewState extends State<ForYouListView> {
  int _selectedIndex = 0;
  List<String> _categories = [];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    // Simulate a network call
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _categories = [
        'For You',
        'Music',
        'Movies',
        'Sports',
        'News',
        'Gaming',
        'Technology',
        'Fashion',
        'Travel',
        'Education'
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      height: 60.0,
      child: _categories.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Chip(
                      label: Text(
                        category,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? Theme.of(context).colorScheme.onTertiary
                              : Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(color: Colors.grey),
                      ),
                      backgroundColor: isSelected
                          ? Theme.of(context).colorScheme.tertiary
                          : Colors.transparent,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
