import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_app/drawer/home_content.dart';
import 'package:my_app/drawer/notification.dart';
import 'package:my_app/drawer/profile_page.dart';
import 'package:my_app/drawer/serch.dart';
import 'package:my_app/drawer/setting_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomBar> {
  final List <Widget> _navItem = [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.person),
    Icon(Icons.notifications),
    Icon(Icons.settings),
  ];
  final List <Widget> _pagesBottom = [
    HomeContent(),
    Serchpage(),
    ProfilePage(),
    NotificationPage(),
    SettingPage()
  ];
 int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: _navItem,
      onTap: (index){
          setState(() {
            _currentIndex = index;
          });
      },
      );
  }
}