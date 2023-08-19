import 'package:flutter/material.dart';
import 'package:rr23_2/pages/login_page.dart';
import 'package:rr23_2/theme/dark_theme.dart';
import 'package:rr23_2/theme/light_theme.dart';

void main(List<String> args) {
  runApp(const Instagram());
}
class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Instagram",
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const LoginPage(),
    );
  }
}