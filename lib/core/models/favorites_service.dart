import 'package:flutter/foundation.dart';
import 'coffee.dart';

class FavoritesService extends ChangeNotifier {
  static final FavoritesService _instance = FavoritesService._internal();
  factory FavoritesService() => _instance;
  FavoritesService._internal();

  final Set<String> _favoriteIds = <String>{};

  Set<String> get favoriteIds => Set.from(_favoriteIds);

  List<Coffee> get favorites =>
      mockCoffees.where((coffee) => _favoriteIds.contains(coffee.id)).toList();

  bool isFavorite(String coffeeId) => _favoriteIds.contains(coffeeId);

  void toggleFavorite(String coffeeId) {
    if (_favoriteIds.contains(coffeeId)) {
      _favoriteIds.remove(coffeeId);
    } else {
      _favoriteIds.add(coffeeId);
    }
    notifyListeners();
  }

  void addToFavorites(String coffeeId) {
    if (!_favoriteIds.contains(coffeeId)) {
      _favoriteIds.add(coffeeId);
      notifyListeners();
    }
  }

  void removeFromFavorites(String coffeeId) {
    if (_favoriteIds.contains(coffeeId)) {
      _favoriteIds.remove(coffeeId);
      notifyListeners();
    }
  }

  void clearFavorites() {
    _favoriteIds.clear();
    notifyListeners();
  }
}
