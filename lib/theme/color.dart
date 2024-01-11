import 'package:flutter/material.dart';

final ThemeData lightModeTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(165, 26, 208, 1)),
  useMaterial3: true,
);

final ThemeData darkModeTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(185, 193, 33, 1)),
  //brightness: Brightness.dark,
  useMaterial3: true,
);
