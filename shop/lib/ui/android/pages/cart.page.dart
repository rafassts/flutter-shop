import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop/blocs/cart.bloc.dart';
import 'package:shop/models/cart-item.model.dart';
import 'package:shop/ui/shared/widgets/cart/cart-item.widget.dart';
import 'package:shop/ui/shared/widgets/shared/loader.widget.dart';

class CartPage extends StatelessWidget {
  final price = new NumberFormat("#,##0.00", "pt_BR");
  var items = <CartItemModel>[];
  var bloc;

  CartPage();
  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<CartBloc>(context);
    items = bloc.cart;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Loader(
                object: bloc.cart,
                callback: listCart,
              ),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "R\$ ${price.format(bloc.total)}",
                    style: TextStyle(fontSize: 30),
                  ),
                  TextButton(
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listCart() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(
            items[index].id,
          ),
          child: CartItem(item: items[index]),
          onDismissed: (direction) {
            bloc.remove(items[index]);
          },
          background: Container(
            color: Colors.red.withOpacity(0.1),
          ),
        );
      },
    );
  }
}
