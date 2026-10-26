import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantMenuApp());
}

class FoodItem {
  final String name;
  final double price;
  final IconData icon;

  const FoodItem({
    required this.name,
    required this.price,
    required this.icon,
  });
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  final List<FoodItem> menuItems = const [
    FoodItem(
      name: 'Classic Burger',
      price: 13.90,
      icon: Icons.lunch_dining,
    ),

    FoodItem(
      name: 'Pepperoni Pizza',
      price: 20.50,
      icon: Icons.local_pizza,
    ),

    FoodItem(
      name: 'Creamy Carbonara',
      price: 18.00,
      icon: Icons.dinner_dining,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.deepOrange.shade100,
                child: Icon(item.icon, color: Colors.deepOrange),
              ),
              title: Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: Text(
                'RM ${item.price.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.deepOrange.shade800,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}