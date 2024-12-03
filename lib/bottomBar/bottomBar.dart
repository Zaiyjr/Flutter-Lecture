import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {

  List item = [
    'ຫນ້າຫລັກ',
    '',
    'ເຊື່ອມຕໍ່ກັບອິນເຕີເນັດ',
  ];

  List icon = [
    Icon(
      Icons.settings,
      size: 25,
      color: Colors.orange.shade800,
    ),
    Icon(
      Icons.data_usage,
      size: 25,
      color: Colors.orange.shade800,
    ),
    Icon(
      Icons.wifi,
      size: 25,
      color: Colors.orange.shade800,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
         BottomNavigationBarItem(icon: icon[0], label: item[0]),
         BottomNavigationBarItem(icon: icon[1], label: item[1]),
         BottomNavigationBarItem(icon: icon[2], label: item[2]),
    ],
    );
  }
}