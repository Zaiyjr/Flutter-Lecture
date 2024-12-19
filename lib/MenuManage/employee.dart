import 'package:flutter/material.dart';

class Employee_Page extends StatefulWidget {
  const Employee_Page({super.key});

  @override
  State<Employee_Page> createState() => _Employee_PageState();
}

class _Employee_PageState extends State<Employee_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ພະນັກງານ'),
      ),
      body: Center(child: Text('Hello world')),
    );
  }
}