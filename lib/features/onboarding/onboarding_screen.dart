import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // أبعاد الشاشة
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // خلفية الصورة
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding_coffee.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  Container(color: Colors.brown.shade200),
            ),
          ),

          // تدرج داكن من الأسفل للأعلى لزيادة التباين مثل الصورة المرفقة
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

          // المحتوى السفلي: العنوان، الوصف، والزر
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
                      fontSize: 38,
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
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: screenWidth,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushReplacementNamed('/'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD17842),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        textStyle: GoogleFonts.sora(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        elevation: 0,
                      ),
                      child: const Text('Get Started'),
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
