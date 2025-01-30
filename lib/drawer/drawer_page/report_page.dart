import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ລາຍງານ"),
        backgroundColor: Colors.green.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "ລາຍງາຍການຂາຍ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Example item count
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: const Icon(Icons.bar_chart, color: Colors.green),
                      title: Text("ລາຍງານຂາຍ ${index + 1}"),
                      subtitle: const Text("ລາຍລະອຽດລາຍງານ"),
                      onTap: () {
                        // Navigate to detailed report
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