import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gourmet Bites Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}

// Data Model for Food Items
class FoodItem {
  final String name;
  final String price;
  final String description;
  final IconData icon;

  const FoodItem({
    required this.name,
    required this.price,
    required this.description,
    required this.icon,
  });
}

// Main Menu Screen
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  final List<FoodItem> menuItems = const [
    FoodItem(
      name: 'Classic Beef Burger',
      price: 'RM 18.50',
      description: 'Juicy grilled beef patty topped with fresh lettuce, cheddar cheese, tomatoes, and house special sauce in a toasted brioche bun.',
      icon: Icons.lunch_dining,
    ),
    FoodItem(
      name: 'Margherita Pizza',
      price: 'RM 24.00',
      description: 'Traditional Italian pizza topped with rich tomato sauce, fresh mozzarella, aromatic basil leaves, and a drizzle of olive oil.',
      icon: Icons.local_pizza,
    ),
    FoodItem(
      name: 'Creamy Carbonara Pasta',
      price: 'RM 21.00',
      description: 'Spaghetti tossed in a velvety sauce made of egg yolks, Parmesan cheese, crispy beef bacon, and freshly cracked black pepper.',
      icon: Icons.ramen_dining,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gourmet Bites Menu'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  item.icon,
                  size: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              title: Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  item.price,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigation to Detail Screen (Extra Task)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodDetailScreen(foodItem: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Food Detail Screen (Extra Task)
class FoodDetailScreen extends StatelessWidget {
  final FoodItem foodItem;

  const FoodDetailScreen({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodItem.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                foodItem.icon,
                size: 70,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              foodItem.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              foodItem.price,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            Text(
              foodItem.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
