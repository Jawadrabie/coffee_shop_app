import 'package:flutter/material.dart';
import '../core/models/coffee.dart';
import 'coffee_card.dart';

class CoffeeGrid extends StatelessWidget {
  const CoffeeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final coffees = mockCoffees;

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 18,
        crossAxisSpacing: 18,
        childAspectRatio: 0.72,
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
          onTap: () =>
              Navigator.of(context).pushNamed('/details', arguments: c),
        );
      },
    );
  }
}






