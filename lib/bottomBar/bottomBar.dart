import 'package:flutter/material.dart';
import 'package:my_app/MenuManage/unit_page.dart'; // Import other pages as needed

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  // List of pages corresponding to each bottom navigation item
  final List <Widget> _pages = [
    HomePage(),
    SearchPage(),
    SettingsPage(),
    LogoutPage(),
  ];

  int _selectedIndex = 0; // Tracks the current index

  // Change index and update the screen
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget RoutePage(){
    return _pages[_selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
         currentIndex: _selectedIndex,
         onTap: _onItemTapped, // Handle tap on navigation item
         selectedItemColor: Colors.orange, // Color for the selected item
         unselectedItemColor: Colors.black, // Color for unselected items
         type: BottomNavigationBarType.fixed, // Ensures all items show text
         items: const [
           BottomNavigationBarItem(
             icon: Icon(Icons.home_filled),
             label: 'ໜ້າຫຼັກ',
           ),
           BottomNavigationBarItem(
          
             icon: Icon(Icons.search),
             label: 'ຄົ້ນຫາ',
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.settings),
             label: 'ການຕັ້ງຄ່າ',
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.logout_sharp),
             label: 'ອອກຈາກລະບົບ',
           ),
         ],
       );
  }
}

// Example Pages
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const Center(child: Text('Home Page')),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: const Center(child: Text('Search Page')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const Center(child: Text('Settings Page')),
    );
  }
}

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Pops back to the previous screen
          },
          child: const Text('Logout and Go Back'),
        ),
      ),
    );
  }
}
