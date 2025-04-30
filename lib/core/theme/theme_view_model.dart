import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:lulu_store_app/base/base_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/themes.dart';

class ThemeViewModel extends BaseViewModel {
  final BehaviorSubject<bool> isDarkMode = BehaviorSubject.seeded(false);

  bool get isDarkModeValue => isDarkMode.value;

   Stream<bool> get isDarkModeStream => isDarkMode.stream;

  ThemeViewModel() {
    _loadTheme();
  }

   Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
     bool isDark = prefs.getBool('isDarkTheme') ?? false;
     isDark? isDarkMode.add(true): isDarkMode.add(false);
   }

   Future<void> toggleTheme() async {
     final prefs = await SharedPreferences.getInstance();
     bool currentTheme = isDarkMode.value;
     bool newTheme = !currentTheme;
     await prefs.setBool('isDarkTheme', newTheme);
     isDarkMode.add(newTheme);
   }

  ThemeData get currentTheme => isDarkMode.value ? AppThemes.darkTheme : AppThemes.lightTheme;

  @override
  void dispose() {
    super.dispose();
    isDarkMode.close();
  }


}