import 'package:flutter/material.dart';

class EmployeePage extends StatelessWidget {
  // Dummy data for employees
  final List<Map<String, String>> employees = [
    {'name': 'John Doe', 'role': 'Manager', 'contact': '+1234567890'},
    {'name': 'Jane Smith', 'role': 'Cashier', 'contact': '+0987654321'},
    {'name': 'Paul Wilson', 'role': 'Technician', 'contact': '+1122334455'},
    {'name': 'Emily Davis', 'role': 'Supervisor', 'contact': '+6677889900'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ຂໍ້ມູນພະນັກງານ', 
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.green.shade900),
              title: Text(
                employee['name'] ?? 'Unknown',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${employee['role']} • ${employee['contact']}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${employee['name']} tapped!')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
