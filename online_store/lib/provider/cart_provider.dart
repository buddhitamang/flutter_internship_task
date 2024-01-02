import 'package:flutter/foundation.dart';
import 'package:online_store/Model/product.dart';
import '../services/api_services.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addProductToCart(Product product) {
    _cartItems.add(product);
    notifyListeners(); // Notify listeners that the cart has been updated
  }

  void removeProductFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners(); // Notify listeners that the cart has been updated
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners(); // Notify listeners that the cart has been updated
  }
}
