import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// rating displayed inline; keep import removed
import '../../core/models/coffee.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, this.coffee});

  final Coffee? coffee;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    final Coffee coffee =
        widget.coffee ??
        (ModalRoute.of(context)?.settings.arguments as Coffee? ??
            mockCoffees.first);

    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'Detail',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.favorite_border_rounded, color: Colors.black87),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              coffee.imagePath,
              height: 260,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 28,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Ice/Hot',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              _IconChip(asset: 'assets/icons/Fast Delivery.svg'),
              const SizedBox(width: 10),
              _IconChip(asset: 'assets/icons/Quality Bean.svg'),
              const SizedBox(width: 10),
              _IconChip(asset: 'assets/icons/extra Milk.svg'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.star, color: Color(0xFFFBBE21)),
              const SizedBox(width: 6),
              Text(
                coffee.rating.toStringAsFixed(1),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 6),
              Text('(230)', style: TextStyle(color: Colors.grey.shade500)),
            ],
          ),
          const SizedBox(height: 16),
          Container(height: 1, color: Colors.black12),
          const SizedBox(height: 16),
          const Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.grey.shade600,
                height: 1.6,
                fontSize: 15,
              ),
              children: const [
                TextSpan(
                  text:
                      'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ',
                ),
                TextSpan(
                  text: 'Read More',
                  style: TextStyle(
                    color: Color(0xFFD17842),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Size',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _SizeChip(
                label: 'S',
                selected: selectedSize == 'S',
                onTap: () => setState(() => selectedSize = 'S'),
              ),
              const SizedBox(width: 12),
              _SizeChip(
                label: 'M',
                selected: selectedSize == 'M',
                onTap: () => setState(() => selectedSize = 'M'),
              ),
              const SizedBox(width: 12),
              _SizeChip(
                label: 'L',
                selected: selectedSize == 'L',
                onTap: () => setState(() => selectedSize = 'L'),
              ),
            ],
          ),
          const SizedBox(height: 100),
        ],
      ),
      bottomNavigationBar: _BottomBar(price: coffee.price),
    );
  }
}

class _SizeChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  const _SizeChip({required this.label, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color border = selected
        ? const Color(0xFFD17842)
        : const Color(0xFFE0E0E0);
    final Color fill = selected ? const Color(0xFFFFE9DF) : Colors.white;
    final Color text = selected ? const Color(0xFFD17842) : Colors.black87;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        decoration: BoxDecoration(
          color: fill,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: border),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: text,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class _IconChip extends StatelessWidget {
  final String asset;
  const _IconChip({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5EF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: SvgPicture.asset(
          asset,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            Color(0xFFD17842),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final double price;
  const _BottomBar({required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price', style: TextStyle(color: Colors.grey.shade500)),
              const SizedBox(height: 6),
              Text(
                '\$ ${price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                  color: Color(0xFFD17842),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD17842),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text(
                  'Buy Now',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
