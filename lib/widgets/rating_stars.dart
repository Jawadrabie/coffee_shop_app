import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final int count;
  const RatingStars({super.key, required this.rating, this.count = 5});

  @override
  Widget build(BuildContext context) {
    final full = rating.floor();
    final hasHalf = (rating - full) >= 0.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < count; i++)
          Icon(
            i < full
                ? Icons.star
                : (i == full && hasHalf ? Icons.star_half : Icons.star_border),
            size: 16,
            color: Colors.amber.shade600,
          ),
      ],
    );
  }
}
