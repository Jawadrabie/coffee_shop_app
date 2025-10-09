import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DriverInfoCard extends StatelessWidget {
  const DriverInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/icons/Imageprofile.png'),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Brooklyn Simmons",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("Personal Courier", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/IconCall.png',
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
