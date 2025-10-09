import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/routing/app_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding_coffee.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  Container(color: Colors.brown.shade200),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.85),
                    Colors.black.withOpacity(0.45),
                    Colors.black.withOpacity(0.10),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.25, 0.5, 1.0],
                ),
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: screenHeight * 0.08,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Fall in Love with\nCoffee in Blissful\nDelight!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontSize: 32,
                      height: 1.25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Welcome to our cozy coffee corner, where\n'
                    'every cup is a delightful for you.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      color: const Color(0xFFB8B8B8),
                      fontSize: 13,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: screenWidth,
                    child: Material(
                      color: const Color(0xFFD17842),
                      borderRadius: BorderRadius.circular(22),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(22),
                        onTap: () {
                          print('Get Started button pressed');
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(AppRoutes.home);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Center(
                            child: Text(
                              'Get Started',
                              style: GoogleFonts.sora(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
