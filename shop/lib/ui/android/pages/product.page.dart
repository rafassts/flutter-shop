import 'package:flutter/material.dart';
import 'package:shop/models/product-details.model.dart';
import 'package:shop/repositories/product.repository.dart';
import 'package:shop/ui/shared/widgets/shared/progress-indicator.widget.dart';

class ProductPage extends StatelessWidget {
  final String tag;
  final repository = new ProductRepository();

  ProductPage({required this.tag});

  @override
  Widget build(BuildContext context) {
    //renderiza quando houver o retorno do repositório
    return FutureBuilder<ProductDetailsModel>(
      future: repository.getByTag(tag),
      builder: (context, snapshot) {
        ProductDetailsModel? product = snapshot.data;

        //gerencia a conexão
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text("Aguardando...");
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: GenericProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: Text("Não foi possível obter o produto"),
              );
            }
            return productContent(product);
        }
      },
    );
  }

  Widget productContent(ProductDetailsModel? product) {
    return Scaffold(
      appBar: AppBar(),
      body: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product?.images.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 200,
            child: Image.network(product != null ? product.images[index] : ""),
          );
        },
      ),
    );
  }
}
