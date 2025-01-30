
// Import necessary packages
import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/drawer/home_content.dart';
import 'package:my_app/drawer/notification.dart';
import 'package:my_app/drawer/profile_page.dart';
import 'package:my_app/drawer/serch.dart';
import 'package:my_app/drawer/setting_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  final List <Widget> _navItem = [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.person),
    Icon(Icons.notifications),
    Icon(Icons.settings),
  ];
  final List <Widget> _pagesBottom = [
    HomeContent(),
    Serchpage(),
    ProfilePage(),
    NotificationPage(),
    SettingPage()
  ];
 int _currentIndex = 0;
  
  List<dynamic> data = [];
  List<dynamic> filteredData = [];
  bool isLoading = true;
  final String url = 'http://10.0.2.2:3000/api/product';
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAllData();
    searchController.addListener(searchData);
  }

  // Fetch all data from API
  Future<void> fetchAllData() async {
    setState(() => isLoading = true);
    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        setState(() {
          data = json.decode(res.body);
          filteredData = data;
        });
      } else {
        showErrorDialog('Failed to fetch data: ${res.statusCode}');
      }
    } catch (err) {
      showErrorDialog('Error fetching data: $err');
    } finally {
      setState(() => isLoading = false);
    }
  }

  // Search data
  void searchData() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredData = data
          .where((item) =>
      item['p_name'].toString().toLowerCase().contains(query) ||
          item['p_category'].toString().toLowerCase().contains(query))
          .toList();
    });
  }

  // Show error dialog
  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Notice'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Delete product
  void deleteProduct(String id) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this product?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      setState(() => isLoading = true);
      try {
        final res = await http.delete(Uri.parse('$url/$id'));
        if (res.statusCode == 200) {
          fetchAllData(); // Refresh data
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product deleted successfully')),
          );
        } else {
          showErrorDialog('Failed to delete product: ${res.statusCode}');
        }
      } catch (err) {
        showErrorDialog('Error deleting product: $err');
      } finally {
        setState(() => isLoading = false);
      }
    }
  }


  // Edit product
  void editProduct(Map<String, dynamic> product) {
    TextEditingController nameController =
    TextEditingController(text: product['p_name']);
    TextEditingController priceController =
    TextEditingController(text: product['p_price'].toString());
    TextEditingController categoryController =
    TextEditingController(text: product['p_category']);
    TextEditingController descriptionController =
    TextEditingController(text: product['p_description']);
    TextEditingController imageController =
    TextEditingController(text: product['p_image']);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edit Product'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: imageController,
                decoration: const InputDecoration(labelText: 'Image URL'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(ctx).pop(); // Close dialog
              setState(() => isLoading = true);

              // Make API call to update data (replace with your API logic)
              try {
                final updatedProduct = {
                  'p_name': nameController.text,
                  'p_price': double.parse(priceController.text),
                  'p_category': categoryController.text,
                  'p_description': descriptionController.text,
                  'p_image': imageController.text,
                };

                final res = await http.put(
                  Uri.parse('$url/${product['_id']}'), // Replace with correct API URL
                  headers: {'Content-Type': 'application/json'},
                  body: json.encode(updatedProduct),
                );

                if (res.statusCode == 200) {
                  fetchAllData(); // Refresh data
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Product updated successfully')),
                  );
                } else {
                  showErrorDialog('Failed to update product: ${res.statusCode}');
                }
              } catch (err) {
                showErrorDialog('Error updating product: $err');
              } finally {
                setState(() => isLoading = false);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        centerTitle: true,
        title: const Text('ຂໍ້ມູນປະເພດສິນຄ້າ',style: TextStyle(color: Colors.white,fontSize: 32),),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                labelText: 'Search',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    searchController.clear();
                    searchData();
                  },
                  icon: const Icon(Icons.close,
                      size: 25, color: Colors.deepOrange),
                ),
              ),
            ),
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : filteredData.isEmpty
          ? const Center(child: Text('No data available'))
          : ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (context, index) {
          final item = filteredData[index];
          return Column(
            children: [
              ListTile(
                leading: Image.network(item['p_image']) != null &&
                    item['p_image'].isNotEmpty
                    ? Image.network(
                  item['p_image'],
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                        Icons.image_not_supported,
                        size: 50);
                  },
                   fit: BoxFit.cover,
                )
                    : const Icon(Icons.image, size: 50),
                title: Column(
                  children: [
                     Text('ຊື່ສິນຄ້າ: ${item['p_name']}'),
                     
                  ],
                ),
                subtitle: Column(
                  children: [
                   
                    Text('ລາຄາ: ${item['p_price']}'),
                     Text('ໝວດໝູ່: ${item['p_category']}'),
                    Text('ຈຳນວນ: ${item['p_quantity']}'),
                    Text('ຄຳອະທິບາຍ: ${item['p_description']}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => editProduct(item),
                      icon: const Icon(Icons.edit,
                          size: 30, color: Colors.green),
                    ),
                    IconButton(
                      onPressed: () => deleteProduct(item['_id'.toString()]),
                      icon: const Icon(Icons.delete,
                          size: 30, color: Colors.red),
                    ),
                  ],
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade800,
        onPressed: () => fetchAllData(),
        child: const Icon(Icons.refresh, size: 30, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: CurvedNavigationBar(
      items: _navItem,
      buttonBackgroundColor: Colors.amber,
      backgroundColor: Colors.green.shade800,
      onTap: (index){
          setState(() {
            _currentIndex = index;
          });
      },
      )
    );
  }
}