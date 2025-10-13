import 'package:flutter/material.dart';
import 'chip_filter.dart';

class CategoriesFilter extends StatelessWidget {
  const CategoriesFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ChipFilter(label: 'All Coffee', selected: true),
          SizedBox(width: 12),
          ChipFilter(label: 'Machiato'),
          SizedBox(width: 12),
          ChipFilter(label: 'Latte'),
          SizedBox(width: 12),
          ChipFilter(label: 'Americano'),
        ],
      ),
    );
  }
}






