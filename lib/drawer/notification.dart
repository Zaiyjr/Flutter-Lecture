import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text('Welcome to the Notification Page',style: TextStyle(fontSize: 24),),
      ],
    ));
  }
}