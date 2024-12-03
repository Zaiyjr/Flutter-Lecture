import 'package:flutter/material.dart';
import 'package:my_app/shop/shop_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.yellow.shade900,
            child: UserAccountsDrawerHeader(
              accountName: Text(
                "Zaiyjr",
                style: TextStyle(fontSize: 20),
              ),
              accountEmail: Text(
                "zaiyjunior@gmail.com",
                style: TextStyle(fontSize: 20),
              ),
              currentAccountPicture: CircleAvatar(
                child: Container(
                  width: 80,
                  height: 80,
                  child: ClipOval(
                     child: Image.network(
                     'https://img.freepik.com/premium-vector/business-global-economy_24877-41082.jpg',
                     fit: BoxFit.cover,
                     ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                // image: DecorationImage(
                    // image: AssetImage(
                    //   'assets/images/bg1.jpg',
                    // ),
                    // fit: BoxFit.cover),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.folder_rounded,
              color: Colors.yellow.shade900,
              size: 30,
            ),
            title: Text(
              "ຈັດການຖາຂໍ້ມູນ",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.shop_rounded,
              color: Colors.yellow.shade900,
              size: 30,
            ),
            title: Text(
              "ຂາຍ",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.arrow_forward,
              color: Colors.yellow.shade900,
              size: 30,
            ),
            title: Text(
              "ສັ່ງຊື່ສິນຄ້າ",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyShopScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.file_download,
              color: Colors.yellow.shade900,
              size: 30,
            ),
            title: Text(
              "ນຳເຂົ້າສິນຄ້າ",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {},
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    "8",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.search,
              color: Colors.yellow.shade900,
              size: 30,
            ),
            title: Text(
              "ຄົ້ນຫາ",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.bar_chart,
              color: Colors.yellow.shade900,
              size: 30,
            ),
            title: Text(
              "ລາຍງານ",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}