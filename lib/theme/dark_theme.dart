import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.black)
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black
  ),
  scaffoldBackgroundColor: Colors.black,
  colorScheme: const ColorScheme.dark(
    background: Colors.black,
    primary: Colors.white,
    secondary: Colors.white,
  )
);