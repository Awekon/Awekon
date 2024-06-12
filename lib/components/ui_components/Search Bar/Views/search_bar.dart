import 'package:awekon/core/Theme/Theme.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key, required this.controller, this.hint = "Search..."});
  final TextEditingController controller;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search,
              color: AppThemes.isDark(context) ? Colors.white : Colors.black),
          hintText: hint,
          hintStyle: TextStyle(
              color:
                  AppThemes.isDark(context) ? Colors.white54 : Colors.black54),
          // hintStyle: const TextStyle(color: Colors.white54),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Theme.of(context).hintColor),
          ),
          filled: true,
          fillColor:
              AppThemes.isDark(context) ? Colors.grey[900] : Colors.grey[200],
        ),
        style: TextStyle(
            color: AppThemes.isDark(context) ? Colors.white : Colors.black),
      ),
    );
  }
}
//
