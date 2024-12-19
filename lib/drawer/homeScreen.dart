import 'package:flutter/material.dart';
import 'package:my_app/MenuManage/menu_page.dart'; // Make sure this is used somewhere
import 'package:my_app/bottomBar/bottomBar.dart';
import 'package:my_app/drawer/drawer.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  // Constants
  static const List<String> items = [
    'ຕັ້ງຄ່າ',
    'ເຊື່ອມຕໍ່ກັບຖານຂໍ້ມູນ',
    'ເຊື່ອມຕໍ່ກັບອິນເຕີເນັດ',
  ];

  static const List<Icon> icons = [
    Icon(Icons.settings, size: 25, color: Colors.orange),
    Icon(Icons.data_usage, size: 25, color: Colors.orange),
    Icon(Icons.wifi, size: 25, color: Colors.orange),
  ];

  static const List<String> menuItems = [
    'ຈັດການຖາຂໍ້ມູນ',
    'ຂາຍ',
    'ສັ່ງຊື່ສິນຄ້າ',
    'ນຳເຂົ້າສິນຄ້າ',
    'ຄົ້ນຫາ',
    'ລາຍງານ',
  ];

  static const List<Icon> menuIcons = [
    Icon(Icons.folder, size: 32, color: Colors.orange),
    Icon(Icons.shop, size: 32, color: Colors.orange),
    Icon(Icons.arrow_forward, size: 32, color: Colors.orange),
    Icon(Icons.download, size: 32, color: Colors.orange),
    Icon(Icons.search, size: 32, color: Colors.orange),
    Icon(Icons.report, size: 32, color: Colors.orange),
  ];

  Widget menuBar() {
    return TabBar(
      isScrollable: true,
      tabs: List.generate(menuItems.length, (index) {
        return Tab(
          icon: menuIcons[index],
          text: menuItems[index],
        );
      }),
    );
  }

  Widget popUpMenu() {
    return PopupMenuButton(
      itemBuilder: (_) => List.generate(items.length, (index) {
        return PopupMenuItem(
          child: Card(
            elevation: 15,
            shadowColor: Colors.orange,
            child: ListTile(
              leading: icons[index],
              title: Text(items[index]),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                // Add functionality based on the selected item
                if (index == 0) {
                  showSetting();
                }
              },
            ),
          ),
        );
      }),
    );
  }

  void showSetting() {
    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text('Settings'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'IP Address',
                ),
              ),SizedBox(height: 10,),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'IP Address',
                ),
              ),SizedBox(height: 10,),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'IP Address',
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Handle the button press
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: menuItems.length,
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade900,
          centerTitle: true,
          title: Text(
            'Xaysana Ketkeo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
          actions: [popUpMenu()],
        ),
        body: Column(
          children: [
            menuBar(),
           Expanded(
              child: TabBarView(
                children: List.generate(menuItems.length, (index) {
                  return Center(
                    child: Text(menuItems[index]),
                  );
                }),
              ),
           ),
          ],
        ),
      bottomNavigationBar: Bottombar(),
      
        )
    );
  }
}
