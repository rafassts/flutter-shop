import 'package:flutter/cupertino.dart';
import 'package:shop/models/cart-item.model.dart';

class CartBloc extends ChangeNotifier {
  var cart = <CartItemModel>[];
  double total = 0;

  get() {
    return cart;
  }

  add(CartItemModel item) {
    cart.add(item);
    calculateTotal();
  }

  remove(CartItemModel item) {
    cart.removeWhere((element) => element.id == item.id);
    calculateTotal();
  }

  itemInCart(CartItemModel item) {
    return cart.any((element) => element.id == item.id);
  }

  increase(CartItemModel item) {
    if (item.quantity < 10) {
      item.quantity++;
      calculateTotal();
    }
  }

  decrease(CartItemModel item) {
    if (item.quantity > 1) {
      item.quantity--;
      calculateTotal();
    }
  }

  calculateTotal() {
    total = 0;
    cart.forEach((element) {
      total += (element.price * element.quantity);
    });
    notifyListeners();
  }
}
