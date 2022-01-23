class CreateUserModel {
  String name;
  String email;
  String username;
  String password;

  CreateUserModel(
      {required this.email,
      required this.name,
      required this.username,
      required this.password});

  factory CreateUserModel.fromJson(Map<String, dynamic> json) {
    return CreateUserModel(
      email: json['email'] ?? "",
      name: json['name'] ?? "",
      username: json['username'] ?? "",
      password: json['password'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
