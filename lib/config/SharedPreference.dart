import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> getPrefsInstance() async {
    if (_prefs != null) {
      return _prefs!;
    } else {
      _prefs = await SharedPreferences.getInstance();
      return _prefs!;
    }
  }

  static Future<T?> getValue<T>(String key, {T? defaultValue}) async {
    final prefs = await getPrefsInstance();
    if (T == bool) {
      return prefs.getBool(key) as T? ?? defaultValue;
    } else if (T == int) {
      return prefs.getInt(key) as T? ?? defaultValue;
    } else if (T == double) {
      return prefs.getDouble(key) as T? ?? defaultValue;
    } else if (T == String) {
      return prefs.getString(key) as T? ?? defaultValue;
    } else if (T == List<String>) {
      return prefs.getStringList(key) as T? ?? defaultValue;
    } else if (T == Map<String, dynamic>) {
      final jsonString = prefs.getString(key);
      if (jsonString != null) {
        return Map<String, dynamic>.from(json.decode(jsonString)) as T?;
      } else {
        return defaultValue;
      }
    } else {
      throw ArgumentError("Unsupported type: $T");
    }
  }

  static Future<void> setValue<T>(String key, T value) async {
    final prefs = await getPrefsInstance();
    if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else if (value is Map<String, dynamic>) {
      await prefs.setString(key, json.encode(value));
    } else {
      throw ArgumentError("Unsupported type: ${value.runtimeType}");
    }
  }
}
