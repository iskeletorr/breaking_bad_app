
// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import '../../constants/enum/app_theme_enum.dart';
import '../theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
   ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => AppThemeLight.instance.theme;

  void changeTheme(AppThemes theme){
    if(theme == AppThemes.LIGHT){
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}