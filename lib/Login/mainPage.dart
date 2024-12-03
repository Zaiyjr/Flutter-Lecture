import 'package:flutter/material.dart';
import 'package:my_app/drawer/drawer.dart';
import 'package:my_app/drawer/homeScreen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Scaffold(
        body: Stack(
          children: [    
            MyHomeScreen(),
          ],
          ),
       )
    );
  }
}