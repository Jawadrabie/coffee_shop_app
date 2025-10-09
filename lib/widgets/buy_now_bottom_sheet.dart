import 'package:flutter/material.dart';
import '../../core/models/coffee.dart';
import '../../features/tracking/tracking_screen.dart';

class BuyNowBottomSheet extends StatelessWidget {
  final Coffee coffee;

  const BuyNowBottomSheet({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              Text(
                '\$ ${coffee.price.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 220,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TrackingScreen(),
                  ),
                );
              },
              child: const Text('Buy Now'),
            ),
          ),
        ],
      ),
    );
  }
}
