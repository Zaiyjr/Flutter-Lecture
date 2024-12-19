import 'package:flutter/material.dart';
import 'package:my_app/MenuManage/menu_page.dart';

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
                image: AssetImage('assets/images/back.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            accountName: const Text("Soutsanouk"),
            accountEmail: const Text("Soutsanouk@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.jpg', // Provide a valid asset image
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.account_circle,
                    size: 60,
                    color: Colors.grey.shade700,
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
                  onTap: () {},
                ),
                _buildDivider(),
                _buildMenuItem(
                  icon: Icons.arrow_forward,
                  title: "ສັງຊື້ສິນຄ້າ",
                  onTap: () {},
                ),
                _buildDivider(),
                _buildMenuItem(
                  icon: Icons.download,
                  title: "ນໍາເຂົ້າສິນຄ້າ",
                  onTap: () {},
                ),
                _buildDivider(),
                _buildMenuItem(
                  icon: Icons.search,
                  title: "ຄົ້ນຫາ",
                  onTap: () {},
                ),
                _buildDivider(),
                _buildMenuItem(
                  icon: Icons.bar_chart,
                  title: "ລາຍງານ",
                  onTap: () {},
                ),
                _buildDivider(),
                _buildMenuItem(
                  icon: Icons.logout,
                  title: "ອອກຈາກລະບົບ",
                  onTap: () {},
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
          color: Colors.amber.shade900,
          size: 30,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
            color: Colors.blue[800],
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
