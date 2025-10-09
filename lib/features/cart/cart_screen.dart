import 'package:flutter/material.dart';
import '../../widgets/app_button.dart';
import '../../core/models/cart_service.dart';
import '../../core/models/coffee.dart';
import '../../core/routing/app_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartService.instance;

    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ValueListenableBuilder<List<CartItem>>(
          valueListenable: cart.items,
          builder: (context, items, _) {
            final total = cart.totalPrice;
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, i) {
                      final it = items[i];
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                it.coffee.imagePath,
                                width: 56,
                                height: 56,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    it.coffee.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    it.coffee.subtitle,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                _QtyBtn(
                                  icon: Icons.remove,
                                  onTap: () => cart.decrement(it.coffee.id),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Text('${it.quantity}'),
                                ),
                                _QtyBtn(
                                  icon: Icons.add,
                                  onTap: () => cart.increment(it.coffee.id),
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            Text(
                              '\$${(it.coffee.price * it.quantity).toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                AppButton(
                  label: 'Checkout',
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.tracking);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _QtyBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}
