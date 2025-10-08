import 'package:flutter/material.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/details/details_screen.dart';
import '../../features/cart/cart_screen.dart';
import '../models/coffee.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String home = '/';
  static const String details = '/details';
  static const String cart = '/cart';

  static Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
    onboarding: (_) => const OnboardingScreen(),
    home: (_) => const HomeScreen(),
    details: (ctx) {
      final args = ModalRoute.of(ctx)?.settings.arguments;
      final Coffee coffee = args is Coffee ? args : mockCoffees.first;
      return DetailScreen(coffee: coffee);
    },
    cart: (_) => const CartScreen(),
  };
}

Route<dynamic> onUnknownRoute(RouteSettings settings) {
  return MaterialPageRoute<void>(
    builder: (_) => Scaffold(
      body: Center(child: Text('Route not found: ${settings.name}')),
    ),
  );
}
