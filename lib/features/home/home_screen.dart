import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/coffee_card.dart';
import '../../widgets/chip_filter.dart';
import '../../core/models/coffee.dart';
import '../../widgets/promo_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coffees = mockCoffees;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location header
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
              const SizedBox(height: 20),

              // Search with filter button (داكن كما في التصميم)
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search coffee',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFF9E9E9E),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF2F2F2F),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD17842),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.percent_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Promo banner
              const PromoBanner(imagePath: 'assets/images/Promo.png'),
              const SizedBox(height: 20),

              // Categories
              SizedBox(
                height: 44,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ChipFilter(label: 'All Coffee', selected: true),
                    SizedBox(width: 12),
                    ChipFilter(label: 'Machiato'),
                    SizedBox(width: 12),
                    ChipFilter(label: 'Latte'),
                    SizedBox(width: 12),
                    ChipFilter(label: 'Americano'),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Products grid (ضمن نفس التمرير)
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  childAspectRatio: 0.72,
                ),
                itemCount: coffees.length,
                itemBuilder: (context, index) {
                  final c = coffees[index];
                  return CoffeeCard(
                    title: c.title,
                    subtitle: c.subtitle,
                    imagePath: c.imagePath,
                    price: c.price,
                    rating: c.rating,
                    onTap: () => Navigator.of(
                      context,
                    ).pushNamed('/details', arguments: c),
                      );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _BottomNav(
        onTapCart: () => Navigator.of(context).pushNamed('/cart'),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final VoidCallback onTapCart;
  const _BottomNav({required this.onTapCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavItem(
              asset: 'assets/icons/Homehome.svg',
              active: true,
              onTap: () {},
            ),
            _NavItem(asset: 'assets/icons/Heartfavorit.svg', onTap: () {}),
            _NavItem(asset: 'assets/icons/Bagcart.svg', onTap: onTapCart),
            _NavItem(
              asset: 'assets/icons/NotificationNotification.svg',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String asset;
  final bool active;
  final VoidCallback onTap;
  const _NavItem({
    required this.asset,
    this.active = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = active
        ? const Color(0xFFD17842)
        : const Color(0xFFBDBDBD);
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            asset,
            width: active ? 28 : 26,
            height: active ? 28 : 26,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: active ? 18 : 0,
            height: 4,
            decoration: BoxDecoration(
              color: active ? const Color(0xFFD17842) : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
