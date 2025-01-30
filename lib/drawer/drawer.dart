import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/MenuManage/menu_page.dart';
import 'package:my_app/drawer/drawer_page/import_product_page.dart';
import 'package:my_app/drawer/drawer_page/order_product_page.dart';
import 'package:my_app/drawer/drawer_page/report_page.dart';
import 'package:my_app/drawer/drawer_page/sale_page.dart';
import 'package:my_app/drawer/drawer_page/search_product_page.dart';
import 'package:my_app/drawer/homeScreen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // User profile section
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKDkW6Irk6pvAXWLRa6jZe0RStRumZ74K3g&s'),
                 fit: BoxFit.cover,
              ),
            ),
            accountName: const Text("ໄຊຊະນະ ເກດແກ້ວ",style: TextStyle(color: Colors.white,fontSize: 22),),
            accountEmail: const Text("xaysana@gmail.com",style: TextStyle(color: Colors.grey)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/9203/9203764.png', // Provide a valid asset image
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.account_circle,
                    size: 60,
                    color: Colors.green,
                  ), // Fallback for missing image
                ),
              ),
            ),
          ),
          // Menu items
          Expanded(
            child: ListView(
              children: [
              
                _buildMenuItem(
                  icon: Icons.home,
                  title: "ໜ້າຫຼັກ",
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (c) => const MyHomeScreen()),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.folder,
                  title: "ຈັດການຂໍ້ມູນພື້ນຖານ",
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (c) => const MenuPage()),
                    );
                  },
                ),
                _buildDivider(),
                _buildMenuItem(
  icon: Icons.assignment_turned_in,
  title: "ຂາຍ",
  onTap: () {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (c) => const SalePage()),
    );
  },
),
_buildMenuItem(
  icon: Icons.arrow_forward,
  title: "ສັງຊື້ສິນຄ້າ",
  onTap: () {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (c) => const OrderProductPage()),
    );
  },
),
_buildMenuItem(
  icon: Icons.download,
  title: "ນໍາເຂົ້າສິນຄ້າ",
  onTap: () {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (c) => const ImportProductPage()),
    );
  },
),
_buildMenuItem(
  icon: Icons.search,
  title: "ຄົ້ນຫາ",
  onTap: () {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (c) => const SearchPage()),
    );
  },
),
_buildMenuItem(
  icon: Icons.bar_chart,
  title: "ລາຍງານ",
  onTap: () {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (c) => const ReportPage()),
    );
  }
),
                _buildDivider(),
                _buildMenuItem(
                  icon: Icons.logout,
                  title: "ອອກຈາກລະບົບ",
                  onTap: () {
                    SystemNavigator.pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create a menu item
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 10,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.green.shade900,
          size: 30,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
            color: Colors.black87,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  // Helper method to create a divider
  Widget _buildDivider() {
    return const Divider(
      thickness: 1.5,
    );
  }
}
