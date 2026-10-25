import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const MyHomePage(),
    );
  }
}

class Food {
  const Food({
    required this.name,
    required this.imagePath,
    required this.description,
  });

  final String name;
  final String imagePath;
  final String description;
}

const foods = [
  Food(
    name: 'Italian Pizza',
    imagePath: 'assets/images/pizza.jpg',
    description:
        'An Italian-style pizza with a golden crust, tomato sauce, '
        'and melted cheese. A comforting classic to enjoy slice by slice.',
  ),
  Food(
    name: 'Carbonara',
    imagePath: 'assets/images/carbonara.jpg',
    description:
        'An Italian pasta dish with a rich, silky sauce, cheese, '
        'and black pepper. A hearty choice for pasta lovers.',
  ),
  Food(
    name: 'Tomato Caprese',
    imagePath: 'assets/images/tomato_caprese.jpg',
    description:
        'A fresh Italian salad with tomatoes, mozzarella, and basil, '
        'finished with olive oil. A light and refreshing choice.',
  ),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontFamily: 'MomoSignature',
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        children: [
          for (final food in foods)
            Card(
              elevation: 5,
              color: Colors.orange,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => FoodDetailsPage(food: food),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset(food.imagePath, width: 100, height: 100),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          food.name,
                          style: const TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                food.imagePath,
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            Text(food.name, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 12),
            Text(
              food.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
