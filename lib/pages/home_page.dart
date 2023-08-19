import 'package:flutter/material.dart';
import 'package:rr23_2/components/post.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> imageList1 = [
    "assets/post1/1.jpg",
    "assets/post1/2.jpg",
    "assets/post1/3.jpg",
  ];
  List<String> imageList2 = [
    "assets/post2/1.jpg",
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Post(
          imageList: imageList1,
          username: widget.username,
          location: "Bina Nusantara University Alam Sutera",
          caption: "Emang boleh ya seBinus ini?",
        ),
        Post(
          imageList: imageList2,
          username: "thomsofficiel__",
          location: "KUMALALA",
          caption: "Waduh 😅",
        )
      ]),
    );
  }
}