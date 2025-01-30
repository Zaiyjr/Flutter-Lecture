import 'package:flutter/material.dart';

class ImportProductPage extends StatelessWidget {
  const ImportProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ນໍາເຂົ້າສິນຄ້າ"),
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
                // Handle import submission
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade900,
              ),
              child: const Text("ນໍາເຂົ້າ"),
            ),
          ],
        ),
      ),
    );
  }
}