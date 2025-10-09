import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search coffee',
              hintStyle: TextStyle(color: Colors.grey.shade400),
              prefixIcon: const Icon(Icons.search, color: Color(0xFF9E9E9E)),
              filled: true,
              fillColor: const Color(0xFF2F2F2F),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
          child: SvgPicture.asset(
            'assets/icons/filter icon.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 24,
            height: 24,
          ),
        ),
      ],
    );
  }
}
