import 'package:flutter/material.dart';

class ExchangePage extends StatelessWidget {
  // Dummy data for exchange rates
  final List<Map<String, String>> rates = [
    {'currency': 'USD', 'rate': '34.50'},
    {'currency': 'EUR', 'rate': '37.80'},
    {'currency': 'GBP', 'rate': '42.10'},
    {'currency': 'JPY', 'rate': '0.28'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ອັດຕາເເລກປ່ຽນ', 
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: rates.length,
        itemBuilder: (context, index) {
          final rate = rates[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: Icon(Icons.currency_exchange, color: Colors.green.shade900),
              title: Text(
                rate['currency'] ?? 'Unknown',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Exchange Rate: ${rate['rate']}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${rate['currency']} rate tapped!')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
