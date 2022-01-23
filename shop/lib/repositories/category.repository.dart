import 'package:dio/dio.dart';
import 'package:shop/models/category.model.dart';
import 'package:shop/settings.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getAll() async {
    var url = "${Settings.apiUrl}/v1/categories";

    Response response = await Dio().get(url);

    return (response.data as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }
}
