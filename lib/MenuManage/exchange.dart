import 'package:flutter/material.dart';

class Exchange_Page extends StatefulWidget {
  const Exchange_Page({super.key});

  @override
  State<Exchange_Page> createState() => _Exchange_PageState();
}

class _Exchange_PageState extends State<Exchange_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ອັດຕາແລກປ່ຽນ'),
      ),
      body: Center(child: Text('Hello world')),
    );
  }
}