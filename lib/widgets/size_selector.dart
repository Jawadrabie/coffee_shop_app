import 'package:flutter/material.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
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
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}






