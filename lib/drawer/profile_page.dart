import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text('Welcome to the Profile Page',style: TextStyle(fontSize: 24),),
      ],
    ));
  }
}