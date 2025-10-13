import 'package:flutter/material.dart';
import '../../core/models/coffee.dart';

class CoffeeImage extends StatelessWidget {
  final Coffee coffee;

  const CoffeeImage({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.asset(
        coffee.imagePath,
        width: double.infinity,
        height: 250,
        fit: BoxFit.cover,
      ),
    );
  }
}






