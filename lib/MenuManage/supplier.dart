import 'package:flutter/material.dart';

class SupplierPage extends StatelessWidget {
  // Dummy data for suppliers
  final List<Map<String, String>> suppliers = [
    {
      'name': 'Supplier 1',
      'location': 'City A',
      'contact': '+1234567890',
    },
    {
      'name': 'Supplier 2',
      'location': 'City B',
      'contact': '+0987654321',
    },
    {
      'name': 'Supplier 3',
      'location': 'City C',
      'contact': '+1122334455',
    },
    {
      'name': 'Supplier 4',
      'location': 'City D',
      'contact': '+6677889900',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ຂໍ້ມູນຜູ້ຕອບສະໜອງ', 
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: suppliers.length,
          itemBuilder: (context, index) {
            final supplier = suppliers[index];
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.business, color: Colors.green.shade900),
                title: Text(
                  supplier['name'] ?? 'No Name',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Location: ${supplier['location'] ?? 'Unknown'}'),
                    Text('Contact: ${supplier['contact'] ?? 'Unknown'}'),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle supplier tap
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${supplier['name']} tapped!')),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
