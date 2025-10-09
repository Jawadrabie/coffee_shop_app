import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;
  const PromoBanner({super.key, required this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.brown.shade200,
                  alignment: Alignment.center,
                  child: const Text(
                    'Promo image missing',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.black.withOpacity(0.10),
                      Colors.black.withOpacity(0.10),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B6B),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Promo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Buy one get',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'one FREE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
