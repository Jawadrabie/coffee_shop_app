import 'package:flutter/material.dart';
import '../../core/models/favorites_service.dart';
import '../../widgets/coffee_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Favorites',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: StatefulBuilder(
        builder: (context, setState) {
          final favorites = FavoritesService().favorites;

          if (favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add items to your favorites',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                childAspectRatio: 0.72,
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final coffee = favorites[index];
                return CoffeeCard(
                  title: coffee.title,
                  subtitle: coffee.subtitle,
                  imagePath: coffee.imagePath,
                  price: coffee.price,
                  rating: coffee.rating,
                  onTap: () => Navigator.of(
                    context,
                  ).pushNamed('/details', arguments: coffee),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
