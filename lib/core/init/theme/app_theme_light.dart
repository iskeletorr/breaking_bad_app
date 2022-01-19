import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    if (_instance == null) _instance = AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  //ThemeData get theme => redTheme;
  @override
  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(iconTheme : IconThemeData(color :Colors.black)),
        scaffoldBackgroundColor: Color(0xFFF1F3F8),
        floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),
        tabBarTheme: tabBarTheme(),
      );

  TabBarTheme tabBarTheme() {
    return TabBarTheme(
        labelPadding: insets.lowPaddingAll,
          // unselectedLabelStyle:
          //     textThemeLight!.headline4.copyWith(color: colorSchemeLight!.gray),
              labelColor: colorSchemeLight!.black,
              labelStyle: textThemeLight!.headline5,
              unselectedLabelColor: colorSchemeLight!.gray);
  }

  TextTheme textTheme() {
    return ThemeData.light().textTheme.copyWith(
        headline1: textThemeLight!.headline1,
        headline2: textThemeLight!.headline2,
        overline: textThemeLight!.headline3);
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: colorSchemeLight!.black,
        primaryVariant: Colors.white, //xx
        secondary: Colors.green,
        secondaryVariant: colorSchemeLight!.azure, //xx
        surface: Colors.blue, //xx
        background: Color(0xfff6f9fc), //xx
        error: Colors.red[900]!,
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black, //x
        onSurface: Colors.purple.shade300,
        onBackground: Colors.black12,
        onError: Color(0xFFffc93c), //xx
        brightness: Brightness.light);
  }
}
