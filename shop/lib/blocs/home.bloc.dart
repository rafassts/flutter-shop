import 'package:flutter/widgets.dart';
import 'package:shop/models/category.model.dart';
import 'package:shop/models/product-list-item.model.dart';
import 'package:shop/repositories/category.repository.dart';
import 'package:shop/repositories/product.repository.dart';

class HomeBloc extends ChangeNotifier {
  final CategoryRepository categoryRepository = new CategoryRepository();
  final ProductRepository productRepository = new ProductRepository();
  List<ProductListItemModel> products = new List.empty();
  List<CategoryModel> categories = new List.empty();
  String selectedCategory = "todos";

  HomeBloc() {
    getCategories();
    getProducts();
  }

  getCategories() {
    categoryRepository.getAll().then((value) {
      this.categories = value;
      notifyListeners();
    });
  }

  getProducts() {
    productRepository.getAll().then((value) {
      this.products = value;
      notifyListeners();
    });
  }

  getProductsByCategory() {
    productRepository.getByCategory(selectedCategory).then((value) {
      this.products = value;
      notifyListeners();
    });
  }

  changeCategory(String newCategory) {
    this.selectedCategory = newCategory;
    products = new List.empty();
    getProductsByCategory();
    notifyListeners();
  }
}
