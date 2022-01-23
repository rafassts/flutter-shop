import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop/blocs/cart.bloc.dart';
import 'package:shop/models/cart-item.model.dart';
import 'package:shop/models/product-list-item.model.dart';

class AddToCart extends StatelessWidget {
  final ProductListItemModel item;

  AddToCart({required this.item});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);

    var cartItem = new CartItemModel(
        id: item.id,
        title: item.title,
        quantity: 1,
        price: item.price,
        image: item.image);

    //se não está no carrinho
    if (!bloc.itemInCart(cartItem)) {
      return Container(
        width: 80,
        height: 40,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Icon(Icons.add_shopping_cart),
          onPressed: () {
            bloc.add(cartItem);
            final snackBar = SnackBar(
              content: Text("${item.title} adicionado"),
              duration: const Duration(seconds: 1),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      );
    }
    //se está no carrinho
    else {
      return Container(
        width: 80,
        height: 40,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Icon(Icons.add_shopping_cart),
          onPressed: () {
            bloc.remove(cartItem);
            final snackBar = SnackBar(
                content: Text("${item.title} removido"),
                duration: const Duration(seconds: 1));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      );
    }
  }
}
