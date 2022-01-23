import 'package:flutter/widgets.dart';
import 'package:shop/models/product-list-item.model.dart';
import 'package:shop/ui/shared/widgets/product/product-card.widget.dart';
import 'package:shop/ui/shared/widgets/shared/loader.widget.dart';

class ProductList extends StatelessWidget {
  final List<ProductListItemModel> products;
  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      child: Loader(
        object: products,
        callback: listProducts,
      ),
    );
  }

  Widget listProducts() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(5),
          child: ProductCard(product: products[index]),
        );
      },
    );
  }
}
