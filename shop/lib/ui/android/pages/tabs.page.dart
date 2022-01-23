import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/blocs/cart.bloc.dart';
import 'package:shop/ui/android/pages/account.page.dart';
import 'package:shop/ui/android/pages/cart.page.dart';
import 'package:shop/ui/android/pages/home.page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    return Scaffold(
      body: TabBarView(
        children: [
          HomePage(),
          CartPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: new TabBar(
        tabs: [
          Tab(icon: new Icon(Icons.home)),
          Tab(
              icon: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.red[600],
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: Text(
                    bloc.cart.length.toString(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          )),
          Tab(icon: new Icon(Icons.perm_identity)),
        ],
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.black38,
        indicatorPadding: EdgeInsets.all(5),
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
