import 'package:flutter/widgets.dart';
import 'package:shop/models/category.model.dart';
import 'package:shop/ui/shared/widgets/category/category-card.widget.dart';
import 'package:shop/ui/shared/widgets/shared/loader.widget.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategoryList({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Loader(object: categories, callback: listCategories),
    );
  }

  Widget listCategories() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(5),
          child: CategoryCard(category: categories[index]),
        );
      },
    );
  }
}
