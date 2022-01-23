import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop/blocs/home.bloc.dart';
import 'package:shop/models/category.model.dart';

import '../../../../settings.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = Provider.of<HomeBloc>(context); //singleton

    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: category.tag == homeBloc.selectedCategory
            ? Theme.of(context).primaryColor.withOpacity(0.3)
            : Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(70),
        ),
      ),
      child: TextButton(
        child: Image.asset(
            "assets/categories/${Settings.theme}/${category.tag}.png"),
        onPressed: () {
          homeBloc.changeCategory(category.tag);
        },
      ),
    );
  }
}
