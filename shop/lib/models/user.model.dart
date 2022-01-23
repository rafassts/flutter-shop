class UserModel {
  String id;
  String name;
  String email;
  String image;
  String username;
  String password;
  String role;
  String token;

  UserModel(
      {required this.id,
      required this.email,
      required this.name,
      required this.image,
      required this.username,
      required this.password,
      required this.role,
      required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var token = json['token'] == null ? "" : json['token'];
    return UserModel(
        id: json['id'] ?? "",
        email: json['email'] ?? "",
        name: json['name'] ?? "",
        image: json['image'] ?? "",
        username: json['username'] ?? "",
        password: json['password'] ?? "",
        role: json['role'] ?? "",
        token: token);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['username'] = this.username;
    data['password'] = this.password;
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }
}
