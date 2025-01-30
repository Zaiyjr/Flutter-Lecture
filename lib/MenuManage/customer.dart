import 'package:flutter/material.dart';

class CustomerPage extends StatelessWidget {
  // Dummy data for customers
  final List<Map<String, String>> customers = [
    {'name': 'Alice Green', 'location': 'City A', 'purchases': '15'},
    {'name': 'Bob Brown', 'location': 'City B', 'purchases': '22'},
    {'name': 'Cindy White', 'location': 'City C', 'purchases': '7'},
    {'name': 'David Black', 'location': 'City D', 'purchases': '18'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ຂໍ້ມູນລູກຄ້າ',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: Icon(Icons.person_outline, color: Colors.green.shade900),
              title: Text(
                customer['name'] ?? 'Unknown',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Location: ${customer['location']} • Purchases: ${customer['purchases']}',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${customer['name']} tapped!')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
