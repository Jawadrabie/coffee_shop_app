import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/coffee.dart';

class DetailScreen extends StatelessWidget {
  final Coffee coffee;

  const DetailScreen({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Detail',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // صورة المنتج
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                coffee.imagePath,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // اسم المنتج والتقييم والأيقونات
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.title,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      coffee.subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 24),
                        const SizedBox(width: 5),
                        Text(
                          coffee.rating.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          '(230)', // عدد التقييمات
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                // الأيقونات الثلاث
                Row(
                  children: [
                    _buildIconBox('assets/icons/Fast Delivery.png', 'Delivery'),
                    const SizedBox(width: 12),
                    _buildIconBox('assets/icons/Quality Bean.png', 'Bean'),
                    const SizedBox(width: 12),
                    _buildIconBox('assets/icons/extra Milk.png', 'Milk'),
                  ],
                ),
              ],
            ),
            const Divider(height: 40, thickness: 1),

            // الوصف
            Text(
              'Description',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.5,
                  color: Colors.grey.shade600,
                ),
                children: [
                  const TextSpan(
                    text:
                        'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk... ',
                  ),
                  TextSpan(
                    text: 'Read More',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // الحجم
            Text(
              'Size',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const SizeSelector(),
            const SizedBox(height: 80), // مسافة إضافية قبل نهاية التمرير
          ],
        ),
      ),
      // الجزء السفلي الثابت للشراء
      bottomSheet: Container(
        color: Colors.white, // لون خلفية الـ bottomSheet
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
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
    );
  }

  // Widget لبناء صندوق الأيقونة (PNG)
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

// Widget أزرار اختيار الحجم (كما هو)
class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  int _selectedIndex = 1; // جعل الحجم المتوسط هو المختار افتراضيًا
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
                : Colors.white,
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
