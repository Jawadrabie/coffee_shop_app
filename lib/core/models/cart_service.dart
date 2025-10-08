import 'package:flutter/foundation.dart';
import 'coffee.dart';

class CartService {
  static final CartService instance = CartService._();
  CartService._();

  final ValueNotifier<List<CartItem>> items = ValueNotifier<List<CartItem>>(
    <CartItem>[],
  );

  void add(Coffee coffee) {
    final current = List<CartItem>.from(items.value);
    final idx = current.indexWhere((e) => e.coffee.id == coffee.id);
    if (idx >= 0) {
      current[idx].quantity += 1;
    } else {
      current.add(CartItem(coffee: coffee));
    }
    items.value = current;
  }

  void increment(String coffeeId) {
    final current = List<CartItem>.from(items.value);
    final idx = current.indexWhere((e) => e.coffee.id == coffeeId);
    if (idx >= 0) {
      current[idx].quantity += 1;
      items.value = current;
    }
  }

  void decrement(String coffeeId) {
    final current = List<CartItem>.from(items.value);
    final idx = current.indexWhere((e) => e.coffee.id == coffeeId);
    if (idx >= 0) {
      current[idx].quantity -= 1;
      if (current[idx].quantity <= 0) current.removeAt(idx);
      items.value = current;
    }
  }

  double get totalPrice =>
      items.value.fold<double>(0, (s, e) => s + e.coffee.price * e.quantity);
}

