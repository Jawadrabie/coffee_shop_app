import 'package:flutter/material.dart';

class TrackingHeader extends StatelessWidget {
  const TrackingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
