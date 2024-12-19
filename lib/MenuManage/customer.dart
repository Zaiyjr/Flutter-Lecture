import 'package:flutter/material.dart';

class Customer_Page extends StatefulWidget {
  const Customer_Page({super.key});

  @override
  State<Customer_Page> createState() => _Customer_PageState();
}

class _Customer_PageState extends State<Customer_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ລູກຄ້າ'),
      ),
      body: Center(child: Text('Hello world')),
    );
  }
}