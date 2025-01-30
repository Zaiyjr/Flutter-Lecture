import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text('Welcome to the Setting Page',style: TextStyle(fontSize: 24),),
      ],
    ));
  }
}