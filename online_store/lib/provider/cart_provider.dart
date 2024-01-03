import 'package:flutter/foundation.dart';
import 'package:online_store/Model/product.dart';
import '../services/api_services.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addProductToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeProductFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  // void clearCart() {
  //   _cartItems.clear();
  //   notifyListeners();
  // }
  bool isProductInCart(Product product) {
    return _cartItems.any((cartProduct) => cartProduct.title == product.title);
  }

}
