import 'package:flutter/material.dart';

class ProgressSteps extends StatelessWidget {
  const ProgressSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 60, height: 4, color: Colors.green),
        const SizedBox(width: 5),
        Container(width: 60, height: 4, color: Colors.green),
        const SizedBox(width: 5),
        Container(width: 60, height: 4, color: Colors.green),
        const SizedBox(width: 5),
        Container(width: 60, height: 4, color: Colors.grey),
      ],
    );
  }
}
