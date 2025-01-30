import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text('Welcome to the Home Page',style: TextStyle(fontSize: 24),),
      ],
    ));
  }
}