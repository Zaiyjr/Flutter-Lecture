import 'package:flutter/material.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ຂາຍ"),
        backgroundColor: Colors.green.shade900,
      ),
      body: ListView.builder(
        itemCount: 10, // Example item count
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.green),
              title: Text("ສິນຄ້າ ${index + 1}"),
              subtitle: const Text("ລາຄາ: 100,000 ກີບ"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to product details or perform sale action
              },
            ),
          );
        },
      ),
    );
  }
}