import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ຂໍ້ມູນປະເພດສິນຄ້າ'),),
      body: Center(child: Text('ສະແດງການຈັດການຂໍ້ມູນປະເພດສິນຄ້າ')),
    );
  }
}