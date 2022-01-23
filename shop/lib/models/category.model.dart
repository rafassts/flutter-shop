class CategoryModel {
  String id;
  String title;
  String tag;

  CategoryModel({required this.id, required this.title, required this.tag});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'] ?? "",
        title: json['title'] ?? "",
        tag: json['tag'] ?? "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['tag'] = this.tag;
    return data;
  }
}
