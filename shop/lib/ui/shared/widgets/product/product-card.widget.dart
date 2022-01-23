import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/models/product-list-item.model.dart';
import 'package:shop/ui/android/pages/product.page.dart';
import 'package:shop/ui/shared/widgets/shared/add-to-cart.widget.dart';

class ProductCard extends StatelessWidget {
  final ProductListItemModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final price = new NumberFormat("#,##0.00", "pt_BR"); //intl

    return Container(
      margin: EdgeInsets.all(5),
      width: 240,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.03),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(tag: product.tag),
                ),
              );
            },
            child: Container(
              //imagem do item
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                  )),
            ),
          ),
          SizedBox(height: 10),
          Container(
            //nome do produto
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            height: 60,
            child: Text(
              product.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            //marca do produto
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Text(
              product.brand,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            //linha com os dados do item e botão
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120,
                  child: Text(
                    "R\$ ${price.format(product.price)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                AddToCart(item: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}
