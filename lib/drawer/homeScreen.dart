import 'package:flutter/material.dart';
import 'package:my_app/drawer/drawer.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  List item = [
    'ຕັ້ງຄ່າ',
    'ເຊື່ອມຕໍ່ກັບຖານຂໍ້ມູນ',
    'ເຊື່ອມຕໍ່ກັບອິນເຕີເນັດ',
  ];

  List icon = [
    Icon(
      Icons.settings,
      size: 25,
      color: Colors.orange.shade800,
    ),
    Icon(
      Icons.data_usage,
      size: 25,
      color: Colors.orange.shade800,
    ),
    Icon(
      Icons.wifi,
      size: 25,
      color: Colors.orange.shade800,
    )
  ];

  List menuItem = [
    'ຈັດການຖາຂໍ້ມູນ',
    'ຂາຍ',
    'ສັ່ງຊື່ສິນຄ້າ',
    'ນຳເຂົ້າສິນຄ້າ',
    'ຄົ້ນຫາ',
    'ລາຍງານ',
  ];

  List menuIcon = [
     Icon(
      Icons.folder,
      size: 32,
      color: Colors.white,
    ),
    Icon(
      Icons.shop,
      size: 32,
      color: Colors.white,
    ),
    Icon(
      Icons.arrow_forward,
      size: 32,
      color: Colors.white,
    ),
    Icon(
      Icons.download,
      size: 32,
      color: Colors.white,
    ),
    Icon(
      Icons.search,
      size: 32,
      color: Colors.white,
    ),
    Icon(
      Icons.report,
      size: 32,
      color: Colors.white,
    )
  ];

  Widget MenuBar(){
  return TabBar(
    isScrollable: true,
    tabs: [
    Tab(
      icon: menuIcon[0],
      text: menuItem[0],
    ),
     Tab(
      icon: menuIcon[1],
      text: menuItem[1],
    ),
     Tab(
      icon: menuIcon[2],
      text: menuItem[2],
    ),
     Tab(
      icon: menuIcon[3],
      text: menuItem[3],
    ),
     Tab(
      icon: menuIcon[4],
      text: menuItem[4],
    ),
     Tab(
      icon: menuIcon[5],
      text: menuItem[5],
    ),
  ]);
}
  Widget PopUpMenu() {
    return PopupMenuButton(
      itemBuilder: (_) => [
        PopupMenuItem(
          child: Card(
            elevation: 15,
            shadowColor: Colors.orange,
            child: ListTile(
              leading: icon[0],
              title: Text('${item[0]}'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        PopupMenuItem(
          child: Card(
            elevation: 15,
            shadowColor: Colors.orange,
            child: ListTile(
              leading: icon[1],
              title: Text('${item[1]}'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        PopupMenuItem(
          child: Card(
            elevation: 15,
            shadowColor: Colors.orange,
            child: ListTile(
              leading: icon[2],
              title: Text('${item[2]}'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ],
    );
  }

  void ShowSetting() {
    showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
            title: Text('show detting'),
            content: Text('message alert'),
            actions: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'IP Address'),
              ),
              ElevatedButton(onPressed: () {}, child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: menuItem.length,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade900,
          centerTitle: true,
          title: Container(
            child: Text(
              'Home Screen',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white),
            ),
          ),
          actions: [  
            PopUpMenu(),
          ],
         
        ),
      body: TabBarView(
        children: [
          Center(
        child: Text('ຈັດການຖານຂໍ້ມູນ'),
      ),
       Center(
        child: Text('ຂາຍ'),
      ),
       Center(
        child: Text('ສັ່ງຊື້ສິນຄ້າ'),
      ),
       Center(
        child: Text('ນຳເຂົ້າສິນຄ້າ'),
      ), Center(
        child: Text('ຄົ້ນຫາ'),
      ), Center(
        child: Text('ລາຍງານ'),
      )
      ],),

       bottomNavigationBar:  PreferredSize(preferredSize: Size.fromHeight(50.0),child: MenuBar(),),
      ),
      
    );
  }
}
