import 'package:brainshare/Pages/home-drawer-page.dart';
import 'package:brainshare/Pages/create-post-page.dart';
import 'package:brainshare/Pages/user-profile-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  String Text = "";

  int selectedIndex = 0;

  List pages = [
    homePage(),
    CreatePostPage(),
    // TagPage(),
    UserProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      // backgroundColor: Colors.green,

      bottomNavigationBar: SizedBox(
        height: 48,

        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          selectedItemColor: Color(0xff148ffa),
          unselectedItemColor: Color(0xff9cc5f7),
          selectedLabelStyle: TextStyle(fontSize: 0),
          // showSelectedLabels: true,
          // showUnselectedLabels: true,
          onTap: (index) => setState(() => selectedIndex = index),
          iconSize: 26,

          items: [
             BottomNavigationBarItem(label:Text, icon: Icon(CupertinoIcons.home)),
             BottomNavigationBarItem(label:Text, icon: Icon(CupertinoIcons.plus_app)),
             // BottomNavigationBarItem(label:Text, icon: Icon(CupertinoIcons.bookmark)),
             BottomNavigationBarItem(label:Text, icon: Icon(CupertinoIcons.person)),
          ],),
      ),
    );
  }
}
// BottomNavigationBarItem(label:Text, icon: Icon(Icons.home_outlined)),
// BottomNavigationBarItem(label:Text, icon: Icon(Icons.event_note_outlined)),
// BottomNavigationBarItem(label:Text, icon: Icon(Icons.tag)),
// BottomNavigationBarItem(label:Text, icon: Icon(Icons.account_circle_outlined)),