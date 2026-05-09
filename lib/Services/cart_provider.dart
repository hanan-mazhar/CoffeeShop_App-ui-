import 'package:flutter/material.dart';
import '../Models/order_model.dart';

class CartProvider extends ChangeNotifier {
  final List<OrderItem> _items = [];
  String _currentUserId = '';

  List<OrderItem> get items => _items;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalAmount =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  /// Call when user logs in — clears previous user's cart to prevent mixing
  void setUser(String userId) {
    if (_currentUserId != userId) {
      _currentUserId = userId;
      _items.clear();
      notifyListeners();
    }
  }

  void addItem(OrderItem newItem) {
    final idx = _items.indexWhere((e) => e.coffeeId == newItem.coffeeId);
    if (idx >= 0) {
      _items[idx].quantity++;
    } else {
      _items.add(newItem);
    }
    notifyListeners();
  }

  void removeItem(String coffeeId) {
    _items.removeWhere((e) => e.coffeeId == coffeeId);
    notifyListeners();
  }

  void decreaseQuantity(String coffeeId) {
    final idx = _items.indexWhere((e) => e.coffeeId == coffeeId);
    if (idx >= 0) {
      if (_items[idx].quantity > 1) {
        _items[idx].quantity--;
      } else {
        _items.removeAt(idx);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
