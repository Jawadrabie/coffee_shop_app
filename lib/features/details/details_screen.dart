import 'package:flutter/material.dart';
import '../../core/models/coffee.dart';
import '../../widgets/detail_app_bar.dart';
import '../../widgets/coffee_image.dart';
import '../../widgets/coffee_info.dart';
import '../../widgets/description_section.dart';
import '../../widgets/size_selector.dart';
import '../../widgets/buy_now_bottom_sheet.dart';

class DetailScreen extends StatelessWidget {
  final Coffee coffee;

  const DetailScreen({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DetailAppBar(coffee: coffee),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CoffeeImage(coffee: coffee),
            const SizedBox(height: 20),
            CoffeeInfo(coffee: coffee),
            const SizedBox(height: 20),
            const DescriptionSection(),
            const SizedBox(height: 20),
            const SizeSelector(),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomSheet: BuyNowBottomSheet(coffee: coffee),
    );
  }
}
