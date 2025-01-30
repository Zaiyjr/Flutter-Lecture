import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_app/MenuManage/category.dart';
import 'package:my_app/MenuManage/menu_page.dart'; // Make sure this is used somewhere
import 'package:my_app/controllers/bottom_controller.dart';
import 'package:my_app/drawer/bottom_navigation_bar.dart';
import 'package:my_app/drawer/drawer.dart';
import 'package:my_app/drawer/home_content.dart';
import 'package:my_app/drawer/notification.dart';
import 'package:my_app/drawer/profile_page.dart';
import 'package:my_app/drawer/serch.dart';
import 'package:my_app/drawer/setting_page.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  final List <Widget> _navItem = [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.person),
    Icon(Icons.notifications),
    Icon(Icons.settings),
  ];
  final List <Widget> _pagesBottom = [
    HomeContent(),
    Serchpage(),
    ProfilePage(),
    NotificationPage(),
    SettingPage()
  ];
 int _currentIndex = 0;
  
  // Constants
  static const List<String> items = [
    'ຕັ້ງຄ່າ',
    'ເຊື່ອມຕໍ່ກັບຖານຂໍ້ມູນ',
    'ເຊື່ອມຕໍ່ກັບອິນເຕີເນັດ',
  ];

  static const List<Icon> icons = [
    Icon(Icons.settings, size: 25, color: Colors.green),
    Icon(Icons.data_usage, size: 25, color: Colors.green),
    Icon(Icons.wifi, size: 25, color: Colors.green),
  ];

  final List<dynamic> menuItems = [
    'ຈັດການຖານຂໍ້ມູນ'
    'ຂາຍ',
    'ສັ່ງຊື່ສິນຄ້າ',
    'ນຳເຂົ້າສິນຄ້າ',
    'ຄົ້ນຫາ',
    'ລາຍງານ',
  ];

  static const List<Icon> menuIcons = [
    Icon(Icons.folder, size: 32, color: Colors.green),
    Icon(Icons.shop, size: 32, color: Colors.green),
    Icon(Icons.arrow_forward, size: 32, color: Colors.green),
    Icon(Icons.download, size: 32, color: Colors.green),
    Icon(Icons.search, size: 32, color: Colors.green),
    Icon(Icons.report, size: 32, color: Colors.green),
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
  return PopupMenuButton<String>(
    icon: Icon(Icons.more_vert, color: Colors.white),
    onSelected: (String value) {
      if (value == 'settings') {
        showSetting();
      } else if (value == 'database') {
        showDatabaseConnection();
      } else if (value == 'internet') {
        showInternetConnection();
      }
    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        value: 'settings',
        child: ListTile(
          leading: Icon(Icons.settings, color: Colors.green),
          title: Text('ຕັ້ງຄ່າ'),
        ),
      ),
      PopupMenuItem<String>(
        value: 'database',
        child: ListTile(
          leading: Icon(Icons.data_usage, color: Colors.green),
          title: Text('ເຊື່ອມຕໍ່ກັບຖານຂໍ້ມູນ'),
        ),
      ),
      PopupMenuItem<String>(
        value: 'internet',
        child: ListTile(
          leading: Icon(Icons.wifi, color: Colors.green),
          title: Text('ເຊື່ອມຕໍ່ກັບອິນເຕີເນັດ'),
        ),
      ),
    ],
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
            ),
            SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Port',
              ),
            ),
            SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
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

void showDatabaseConnection() {
  showDialog(
    context: context,
    builder: (c) {
      return AlertDialog(
        title: Text('Database Connection'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Database URL',
              ),
            ),
            SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle database connection logic here
                Navigator.of(context).pop();
              },
              child: Text('Connect'),
            ),
          ],
        ),
      );
    },
  );
}

void showInternetConnection() {
  showDialog(
    context: context,
    builder: (c) {
      return AlertDialog(
        title: Text('Internet Connection'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Check your internet connection settings.'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle internet connection logic here
                Navigator.of(context).pop();
              },
              child: Text('Check Connection'),
            ),
          ],
        ),
      );
    },
  );
}

  final List<Widget> pages = [
    // MyHomeScreen(), // Replace with your HomeScreen widget
    // UnitPage(),  
    Center(child: Text('Cart Page')), // Replace with your CartPage
    Center(child: Text('Home')),
    Center(child: Text('Cart Page')), // Replace with your CartPage
    Center(child: Text('Settings Page')), // Replace with your SettingsPage
  ];
   final BottomBarController controller = Get.put(BottomBarController());
  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: menuItems.length,
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          // leading: Icon(Icons.menu_book,color: Colors.white,),
          backgroundColor: Colors.green.shade600,
          centerTitle: true,
          title: Text(
            'Xaysana Ketkeo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
          actions: [popUpMenu(), ],
        ),
        body: 
        Center(
          child: Column(
            children: <Widget>[
            
              menuBar(),
             Expanded(
                child: TabBarView(
                  children: List.generate(menuItems.length, (index) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(menuItems[index]),
                          _pagesBottom[_currentIndex],
                        ],
                      ),
                    );
                  }),
                ),
             ),
            ],
          ),
        ),
         bottomNavigationBar:CurvedNavigationBar(
      items: _navItem,
      buttonBackgroundColor: Colors.amber,
      backgroundColor: Colors.green,
      onTap: (index){
          setState(() {
            _currentIndex = index;
          });
      },
      )
      ),
    );
  }
}
