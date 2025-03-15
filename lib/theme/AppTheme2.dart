// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_learning/appState.dart';

class AppTheme2 {
  ThemeMode? themeMode;

  AppTheme2._() {
    themeMode = ThemeMode.system;
  }

  static final AppTheme2 _instance = AppTheme2._();

  factory AppTheme2() {
    return _instance;
  }

  static AppTheme2 get instance => _instance;

  static Theme of() {
    return AppTheme2.instance.themeMode == ThemeMode.dark ? DarkModeTheme() : LightModeTheme();
  }

  static void setThemeMode() {
    AppTheme2.instance.themeMode = AppTheme2.instance.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setInt('themeMode', themeMode.index);
  }
}

abstract class Theme {
  Color primary;
  Color secondary;
  Color tertiary;
  Color alternate;
  Color primaryText;
  Color secondaryText;
  Color primaryBackground;
  Color secondaryBackground;
  Color success;
  Color warning;
  Color error;
  Color appBar;

  Theme({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.alternate,
    required this.primaryText,
    required this.secondaryText,
    required this.primaryBackground,
    required this.secondaryBackground,
    required this.success,
    required this.warning,
    required this.error,
    required this.appBar,
  });
}

class LightModeTheme extends Theme {
  LightModeTheme()
      : super(
          primary: const Color(0xFF4B39EF),
          secondary: const Color(0xFF39D2C0),
          tertiary: const Color(0xFFEE8B60),
          alternate: const Color(0xFFE0E3E7),
          primaryText: const Color(0xFF14181B),
          secondaryText: const Color(0xFF57636C),
          primaryBackground: const Color(0xFFF1F4F8),
          secondaryBackground: const Color(0xFFFFFFFF),
          success: const Color(0xFF249689),
          warning: const Color(0xFFF9CF58),
          error: const Color(0xFFFF5963),
          appBar: Color(0xFF4472C4),
        );
}

class DarkModeTheme extends Theme {
  DarkModeTheme()
      : super(
          primary: const Color(0xFF4B39EF),
          secondary: const Color(0xFF39D2C0),
          tertiary: const Color(0xFFEE8B60),
          alternate: const Color(0xFF262D34),
          primaryText: const Color(0xFFFFFFFF),
          secondaryText: const Color(0xFF95A1AC),
          primaryBackground: const Color(0xFF1D2428),
          secondaryBackground: const Color(0xFF14181B),
          success: const Color(0xFF249689),
          warning: const Color(0xFFF9CF58),
          error: const Color(0xFFFF5963),
          appBar: Colors.black,
        );
}
