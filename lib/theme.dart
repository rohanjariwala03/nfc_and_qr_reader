import 'package:flutter/material.dart';

ThemeData themeData(Brightness brightness) {
  return ThemeData(
    brightness: brightness,
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      errorStyle: TextStyle(height: 0.75),
      helperStyle: TextStyle(height: 0.75),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(40),
    )),
    scaffoldBackgroundColor: brightness == Brightness.dark
        ? Colors.black
        : null,
    cardTheme: CardTheme(
      color: brightness == Brightness.dark
          ? const Color.fromARGB(255, 28, 28, 30)
          : null,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: brightness == Brightness.dark
          ? const Color.fromARGB(255, 28, 28, 30)
          : null,
    ),
    highlightColor: brightness == Brightness.dark
        ? const Color.fromARGB(255, 44, 44, 46)
        : null,
    splashFactory: NoSplash.splashFactory,
  );
}