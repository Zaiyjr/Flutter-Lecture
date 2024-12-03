import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  String txt = "ສະແດງຕົວເລກ";
  int _count = 0;

  void IncrementNumber(){
    setState(() { 
      _count +=5;
    });
  }

  void DecrementNumber(){
    setState(() { 
      _count --;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.blue.shade400,
            )),
        backgroundColor: Colors.red.shade500,
        title: Text(
          'Cafe Shop',
          style: TextStyle(fontSize: 24.0, color: Colors.blue.shade400),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
            Colors.yellow.shade400,
            Colors.blue.shade400,
          ],radius: 1
          )
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$txt",
                style: TextStyle(fontSize: 48, color: Colors.blue.shade400),
              ),
              Text(
                '$_count',
                style: TextStyle(fontSize: 48, color: Colors.blue.shade400),
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          IncrementNumber();

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
