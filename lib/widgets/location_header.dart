import 'package:flutter/material.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Colors.grey.shade600,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: const [
            Text(
              'Bilzen, Tanjungbalai',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        ),
      ],
    );
  }
}
