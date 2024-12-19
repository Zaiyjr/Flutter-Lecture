import 'package:flutter/material.dart';

class About_Page extends StatefulWidget {
  const About_Page({super.key});

  @override
  State<About_Page> createState() => _About_PageState();
}

class _About_PageState extends State<About_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ກ່ຽວກັບ'),
      ),
      body: Center(child: Text('Hello world')),
    );
  }
}