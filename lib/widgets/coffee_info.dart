import 'package:flutter/material.dart';
import '../../core/models/coffee.dart';
import 'feature_icons.dart';

class CoffeeInfo extends StatelessWidget {
  final Coffee coffee;

  const CoffeeInfo({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coffee.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                coffee.subtitle,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 24),
                  const SizedBox(width: 5),
                  Text(
                    coffee.rating.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    '(230)',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
        const FeatureIcons(),
      ],
    );
  }
}
