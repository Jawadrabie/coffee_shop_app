import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/search_field.dart';
import '../../widgets/coffee_card.dart';
import '../../widgets/chip_filter.dart';
import '../../core/models/coffee.dart';
import '../../widgets/promo_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coffees = mockCoffees;

    return Scaffold(
      appBar: AppBar(title: const Text('Find your coffee')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location header
            Text(
              'Location',
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 4),
            Row(
              children: const [
                Text(
                  'Bilzen, Tanjungbalai',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down, size: 16),
              ],
            ),
            const SizedBox(height: 12),

            // Search with filter button
            Row(
              children: [
                const Expanded(child: SearchField(hintText: 'Search coffee')),
                const SizedBox(width: 12),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.tune_rounded, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Promo banner under search field
            const PromoBanner(imagePath: 'assets/images/promo_banner.png'),
            const SizedBox(height: 12),
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ChipFilter(label: 'All', selected: true),
                  SizedBox(width: 8),
                  ChipFilter(label: 'Cappuccino'),
                  SizedBox(width: 8),
                  ChipFilter(label: 'Latte'),
                  SizedBox(width: 8),
                  ChipFilter(label: 'Espresso'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.68,
                ),
                itemCount: coffees.length,
                itemBuilder: (context, index) {
                  final c = coffees[index];
                  return CoffeeCard(
                    title: c.title,
                    subtitle: c.subtitle,
                    imagePath: c.imagePath,
                    price: c.price,
                    rating: c.rating,
                    onTap: () => context.go('/details'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: (i) {
          if (i == 2) context.go('/cart');
        },
      ),
    );
  }
}
