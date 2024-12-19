import 'package:flutter/material.dart';

class Supplier_Page extends StatefulWidget {
  const Supplier_Page({super.key});

  @override
  State<Supplier_Page> createState() => _Supplier_PageState();
}

class _Supplier_PageState extends State<Supplier_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ຜູ້ຕອບສະໜອງ'),
      ),
      body: Center(child: Text('Hello world')),
    );
  }
}