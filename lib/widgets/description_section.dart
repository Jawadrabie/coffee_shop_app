import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 40, thickness: 1),
        Text(
          'Description',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: Colors.grey.shade600,
            ),
            children: [
              const TextSpan(
                text:
                    'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk... ',
              ),
              TextSpan(
                text: 'Read More',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
