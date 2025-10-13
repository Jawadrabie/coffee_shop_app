import 'package:flutter/material.dart';

class FeatureIcons extends StatelessWidget {
  const FeatureIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconBox('assets/icons/Fast Delivery.png', 'Delivery'),
        const SizedBox(width: 12),
        _buildIconBox('assets/icons/Quality Bean.png', 'Bean'),
        const SizedBox(width: 12),
        _buildIconBox('assets/icons/extra Milk.png', 'Milk'),
      ],
    );
  }

  Widget _buildIconBox(String assetPath, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Image.asset(
            assetPath,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => const SizedBox(width: 24, height: 24),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10)),
        ],
      ),
    );
  }
}






