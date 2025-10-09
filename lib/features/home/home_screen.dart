import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/location_header.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/categories_filter.dart';
import '../../widgets/coffee_grid.dart';
import '../../widgets/promo_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LocationHeader(),
              const SizedBox(height: 20),

              const CustomSearchBar(),
              const SizedBox(height: 20),

              const PromoBanner(imagePath: 'assets/images/Promo.png'),
              const SizedBox(height: 20),

              const CategoriesFilter(),
              const SizedBox(height: 16),

              const CoffeeGrid(),
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
            _NavItem(
              asset: 'assets/icons/Heartfavorit.svg',
              onTap: () => Navigator.of(context).pushNamed('/favorites'),
            ),
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
