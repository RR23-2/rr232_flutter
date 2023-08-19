import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black)
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white
  ),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Colors.black,
    secondary: Colors.black
  )
);