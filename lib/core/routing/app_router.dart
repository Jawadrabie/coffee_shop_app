import 'package:flutter/material.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/details/details_screen.dart';
import '../../features/cart/cart_screen.dart';
import '../../features/tracking/tracking_screen.dart';
import '../../features/favorites/favorites_screen.dart';
import '../models/coffee.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String home = '/';
  static const String details = '/details';
  static const String cart = '/cart';
  static const String tracking = '/tracking';
  static const String favorites = '/favorites';

  static Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
    onboarding: (_) => const OnboardingScreen(),
    home: (_) => const HomeScreen(),
    details: (ctx) {
      final args = ModalRoute.of(ctx)?.settings.arguments;
      final Coffee coffee = args is Coffee ? args : mockCoffees.first;
      return DetailScreen(coffee: coffee);
    },
    cart: (_) => const CartScreen(),
    tracking: (_) => const TrackingScreen(),
    favorites: (_) => const FavoritesScreen(),
  };
}

Route<dynamic> onUnknownRoute(RouteSettings settings) {
  return MaterialPageRoute<void>(
    builder: (_) => Scaffold(
      body: Center(child: Text('Route not found: ${settings.name}')),
    ),
  );
}
