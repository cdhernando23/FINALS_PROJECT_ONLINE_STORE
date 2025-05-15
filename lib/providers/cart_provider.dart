import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/course.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];
  SharedPreferences? _prefs;

  List<CartItem> get items => List.unmodifiable(_items);

  double get totalAmount {
    return _items.fold(0, (sum, item) => sum + item.price);
  }

  int get itemCount => _items.length;

  bool isInCart(String courseId) {
    return _items.any((item) => item.course.id == courseId);
  }

  Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      _loadCart();
    } catch (e) {
      debugPrint('Error initializing cart: $e');
    }
  }

  void addItem(Course course) {
    if (!isInCart(course.id)) {
      _items.add(CartItem(course: course));
      _saveCart();
      notifyListeners();
    }
  }

  void removeItem(String courseId) {
    _items.removeWhere((item) => item.course.id == courseId);
    _saveCart();
    notifyListeners();
  }

  void clear() {
    _items.clear();
    _saveCart();
    notifyListeners();
  }

  void _loadCart() {
    try {
      final cartJson = _prefs?.getString('cart');
      if (cartJson != null) {
        final List<dynamic> decodedData = json.decode(cartJson);
        _items = decodedData
            .map((item) => CartItem.fromJson(item as Map<String, dynamic>))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading cart: $e');
      _items = [];
    }
  }

  void _saveCart() {
    try {
      final cartData = _items.map((item) => item.toJson()).toList();
      _prefs?.setString('cart', json.encode(cartData));
    } catch (e) {
      debugPrint('Error saving cart: $e');
    }
  }
} 