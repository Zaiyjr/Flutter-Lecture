import 'package:flutter/material.dart';

class OrderProductPage extends StatelessWidget {
  const OrderProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ສັງຊື້ສິນຄ້າ"),
        backgroundColor: Colors.green.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "ຊື່ສິນຄ້າ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "ຈຳນວນ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle order submission
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade900,
              ),
              child: const Text("ສັ່ງຊື້"),
            ),
          ],
        ),
      ),
    );
  }
}