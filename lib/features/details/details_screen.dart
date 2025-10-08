import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/coffee.dart';

class DetailScreen extends StatelessWidget {
  final Coffee coffee;

  const DetailScreen({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 1. الجزء القابل للتمرير
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الصورة العلوية مع الأيقونات
                  Stack(
                    children: [
                      Image.asset(
                        coffee.imagePath,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.55,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 50,
                        left: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () => context.pop(),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        right: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          child: IconButton(
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),

                  // قسم التفاصيل
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    coffee.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    coffee.subtitle,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 24,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  coffee.rating.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(height: 40),
                        Text(
                          'Description',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'A ${coffee.title} is a coffee drink that is a variant of a caffè latte, commonly served in a glass rather than a cup. It is made with espresso and steamed milk.',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                height: 1.5,
                                color: Colors.grey.shade600,
                              ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Size',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const SizeSelector(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 2. الجزء السفلي الثابت
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            ),
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
                    onPressed: () {},
                    child: const Text('Buy Now'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  int _selectedIndex = 0;
  final List<String> _sizes = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(_sizes.length, (index) {
        final isSelected = _selectedIndex == index;
        return OutlinedButton(
          onPressed: () => setState(() => _selectedIndex = index),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(100, 45),
            side: BorderSide(
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
            ),
            backgroundColor: isSelected
                ? Theme.of(context).primaryColor.withOpacity(0.1)
                : Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            _sizes[index],
            style: TextStyle(
              color: isSelected ? Theme.of(context).primaryColor : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }),
    );
  }
}
