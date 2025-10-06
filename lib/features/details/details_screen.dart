import 'package:flutter/material.dart';
import '../../widgets/quantity_selector.dart';
import '../../widgets/rating_stars.dart';
import '../../widgets/app_button.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Cappuccino')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/sample_coffee.png',
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              RatingStars(rating: 4.8),
              SizedBox(width: 8),
              Text('(230 reviews)'),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'A balanced blend with rich aroma and creamy texture.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Size',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _SizeChip(label: 'S', selected: true),
              const SizedBox(width: 8),
              _SizeChip(label: 'M'),
              const SizedBox(width: 8),
              _SizeChip(label: 'L'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              QuantitySelector(
                value: qty,
                onChanged: (v) => setState(() => qty = v),
              ),
              const Spacer(),
              Text(
                '\$4.20',
                style: TextStyle(
                  color: cs.primary,
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppButton(label: 'Add to Cart', onPressed: () {}),
        ],
      ),
    );
  }
}

class _SizeChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _SizeChip({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? cs.primary.withOpacity(.1) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: selected ? cs.primary : Colors.black12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? cs.primary : Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
