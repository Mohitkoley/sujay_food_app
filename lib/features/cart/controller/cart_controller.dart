import 'package:flutter/material.dart';
import 'package:food_deliver/models/cart/cart_model.dart';

class CartController extends ChangeNotifier {
  List<CartModel> cartItems = [CartModel(), CartModel()];

  void addItem(CartModel cartItem) {
    cartItems.add(cartItem);
    notifyListeners();
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }
}
