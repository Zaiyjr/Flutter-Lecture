import 'package:flutter/material.dart';
import 'package:my_app/MenuManage/about.dart';
import 'package:my_app/MenuManage/category.dart';
import 'package:my_app/MenuManage/customer.dart';
import 'package:my_app/MenuManage/employee.dart';
import 'package:my_app/MenuManage/exchange.dart';
import 'package:my_app/MenuManage/productPage.dart';
import 'package:my_app/MenuManage/supplier.dart';
import 'package:my_app/MenuManage/unit_page.dart';

// Menu items
final List<String> items = [
  "ຂໍ້ມູນຫົວໜ່ວຍ",
  "ຂໍ້ມູນປະເພດສິນຄ້າ",
  "ຂໍ້ມູນສິນຄ້າ",
  "ຜູ້ຕອບສະໜອງ",
  "ພະນັກງານ",
  "ລູກຄ້າ",
  "ອັດຕາເເລກປ່ຽນ",
  "ກ່ຽວກັບ"
];

// Menu icons
final double iconSize = 60.0;
final Color iconColor = Colors.green.shade900;
final List<Icon> icons = [
  Icon(Icons.ac_unit, size: iconSize, color: iconColor),
  Icon(Icons.category, size: iconSize, color: iconColor),
  Icon(Icons.folder, size: iconSize, color: iconColor),
  Icon(Icons.local_shipping, size: iconSize, color: iconColor),
  Icon(Icons.person, size: iconSize, color: iconColor),
  Icon(Icons.person_add_alt, size: iconSize, color: iconColor),
  Icon(Icons.currency_exchange, size: iconSize, color: iconColor),
  Icon(Icons.help, size: iconSize, color: iconColor),
];

// Corresponding pages for navigation
final List<Widget> routePages = [
  UnitPage(),
  CategoryPage(),
  ProductPage(),
  SupplierPage(),
  EmployeePage(),
  CustomerPage(),
  ExchangePage(),
  AboutPage()
  // Additional pages can be added here
];

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Handle navigation on item click
  void navigateToPage(int index) {
    if (index < routePages.length) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => routePages[index]),
      );
    } else {
      // Handle unsupported pages (e.g., show a dialog or snackbar)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Page not implemented for this menu item.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ການຈັດການເມນູ", style: TextStyle(color: Colors.white,fontSize: 32)),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => navigateToPage(index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(color: Colors.green, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icons[index],
                    const Spacer(),
                    Text(
                      items[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}