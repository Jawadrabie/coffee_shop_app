import 'package:flutter/material.dart';
import '../../core/models/coffee.dart';
import '../../core/models/favorites_service.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Coffee coffee;

  const DetailAppBar({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: const Text(
        'Detail',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        StatefulBuilder(
          builder: (context, setState) {
            final isFavorite = FavoritesService().isFavorite(coffee.id);
            return IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.black,
                size: 28,
              ),
              onPressed: () {
                FavoritesService().toggleFavorite(coffee.id);
                setState(() {});
              },
            );
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
