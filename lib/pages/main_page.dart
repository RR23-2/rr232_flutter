import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rr23_2/pages/account_page.dart';
import 'package:rr23_2/pages/home_page.dart';
import 'package:rr23_2/pages/search_page.dart';

class MainPage extends StatefulWidget {
  final String username;
  const MainPage({super.key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool isDarkTheme = false;
  int selectedPage = 0;
  List<Widget> pages = [
    
  ];
  
  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(username: widget.username),
      const SearchPage(),
      AccountPage(username: widget.username)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Instagram",
          style: GoogleFonts.getFont(
            "Rochester",
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary
          )
        ),
        actions: [
          PopupMenuButton<Widget>(
            icon: Icon(Icons.more_vert, color: Theme.of(context).colorScheme.primary),
            itemBuilder: (context){
              return [
                PopupMenuItem<Widget>(
                  child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return SwitchListTile(
                        title: const Text("Dark Theme"),
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: isDarkTheme,
                        onChanged: (value) {
                          setState(() {
                            isDarkTheme = value;
                          });
                        },
                      );
                    },
                  ),
                )
              ];
            },
          ),
        ],
      ),
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState((){
            selectedPage = value;
          });
        },
        currentIndex: selectedPage,
        items: [
        const BottomNavigationBarItem(tooltip: "Home", label: "Home", icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home)),
        const BottomNavigationBarItem(tooltip: "Search", label: "Search", icon: Icon(Icons.search_outlined), activeIcon: Icon(Icons.search)),
        BottomNavigationBarItem(tooltip: "Account", label: widget.username, icon: CircleAvatar(backgroundImage: AssetImage("assets/${widget.username}.jpg"), radius: 15), activeIcon: CircleAvatar(radius: 15, backgroundColor: const Color(0xFF000000), child :CircleAvatar(backgroundImage: AssetImage("assets/${widget.username}.jpg"), radius: 13.5,))),
      ]),
    );
  }
}