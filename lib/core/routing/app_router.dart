import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/details/details_screen.dart';
import '../../features/cart/cart_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
    GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingScreen()),
    GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
    GoRoute(path: '/details', builder: (_, __) => const DetailsScreen()),
    GoRoute(path: '/cart', builder: (_, __) => const CartScreen()),
  ],
  errorBuilder: (_, state) =>
      Scaffold(body: Center(child: Text('Route not found: ${state.uri}'))),
);
