import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: isDarkMode ? Colors.white : Colors.black),
        hintText: 'Title, author, host, or topic',
        // hintStyle: TextStyle(color: isDarkMode ? Colors.white54 : Colors.black54),
        hintStyle: const TextStyle(color: Colors.white54),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
      ),
      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
    );
  }
}
