import 'package:flutter/material.dart';

class ChipFilter extends StatelessWidget {
  final String label;
  final bool selected;
  const ChipFilter({super.key, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? cs.primary.withOpacity(.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
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
