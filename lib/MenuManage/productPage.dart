import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  // Dummy data for products
  final List<Map<String, String>> products = [
    {'name': 'Product 1', 'price': '\$100'},
    {'name': 'Product 2', 'price': '\$200'},
    {'name': 'Product 3', 'price': '\$300'},
    {'name': 'Product 4', 'price': '\$400'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ຂໍ້ມູນສິນຄ້າ', 
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.shopping_cart, color: Colors.green.shade900),
                title: Text(
                  product['name'] ?? 'No Name',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(product['price'] ?? ''),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle product tap
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product['name']} tapped!')),
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
