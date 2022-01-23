class AuthenticateModel {
  String username;
  String password;

  AuthenticateModel({required this.username, required this.password});

  factory AuthenticateModel.fromJson(Map<String, dynamic> json) {
    return AuthenticateModel(
        username: json['username'] ?? json['username'],
        password: json['password'] ?? json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
