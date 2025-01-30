import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ຄົ້ນຫາ"),
        backgroundColor: Colors.green.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "ຄົ້ນຫາສິນຄ້າ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                // Handle search logic
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Example item count
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: const Icon(Icons.search, color: Colors.green),
                      title: Text("ສິນຄ້າທີ່ພົບ ${index + 1}"),
                      subtitle: const Text("ລາຍລະອຽດສິນຄ້າ"),
                      onTap: () {
                        // Navigate to product details
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}