import 'package:flutter/material.dart';
import 'package:my_app/Login/LoginPage.dart';
import 'package:my_app/Login/loginMain.dart';
import 'package:my_app/views/myHomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Login Page',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: LoginPage(),
    );
  }
}