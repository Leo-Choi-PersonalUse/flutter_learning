import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class AppTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) =>
      mode == ThemeMode.system
          ? _prefs?.remove(kThemeModeKey)
          : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  // static FlutterFlowTheme of(BuildContext context) {
  //   return Theme
  //       .of(context)
  //       .brightness == Brightness.dark
  //       ? DarkModeTheme()
  //       : LightModeTheme();
  // }

}