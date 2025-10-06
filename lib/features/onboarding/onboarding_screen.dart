import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // نستخدم MediaQuery للحصول على أبعاد الشاشة
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        // نستخدم Stack لوضع العناصر فوق بعضها (الخلفية، ثم المحتوى)
        children: [
          // 1. صورة الخلفية
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding_coffee.png', // تم التعديل ليتطابق مع الموجود
              fit: BoxFit.cover, // لجعل الصورة تملأ الشاشة
              errorBuilder: (_, __, ___) =>
                  Container(color: Colors.brown.shade200),
            ),
          ),

          // 2. طبقة لونية داكنة فوق الصورة لزيادة وضوح النص
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          // 3. المحتوى (النص والزر)
          Positioned(
            bottom: screenHeight * 0.1, // تحديد المسافة من الأسفل
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // النص الرئيسي
                  Text(
                    'Coffee so good, your taste buds will love it.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: 34,
                      fontWeight: FontWeight.w600, // Semi-bold
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // النص الفرعي
                  Text(
                    'The best grain, the finest roast, the powerful flavor.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: 14,
                      color: const Color(0xFFA9A9A9),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // زر البدء
                  SizedBox(
                    width: screenWidth,
                    child: ElevatedButton(
                      onPressed: () {
                        // استخدم go_router لتفادي أخطاء navigator lock
                        context.go('/');
                      },
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
