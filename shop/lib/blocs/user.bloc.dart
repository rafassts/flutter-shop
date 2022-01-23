import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/models/authenticate-user.model.dart';
import 'package:shop/models/create-user.model.dart';
import 'package:shop/models/user.model.dart';
import 'package:shop/repositories/account.repository.dart';
import 'package:shop/settings.dart';

class UserBloc extends ChangeNotifier {
  var repository = new AccountRepository();
  UserModel? user;

  UserBloc() {
    user = null;
    loadUser();
  }

  Future<UserModel?> authenticate(AuthenticateModel model) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      user = await repository.authenticate(model);
      await prefs.setString(
          "user", jsonEncode(user)); //shared preferences chave e json
      return user;
    } catch (ex) {
      user = null;
      return null;
    }
  }

  Future<UserModel?> create(CreateUserModel model) async {
    try {
      user = await repository.create(model);
      return user;
    } catch (ex) {
      user = null;
      return null;
    }
  }

  logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    user = null;
    notifyListeners();
  }

  Future loadUser() async {
    var prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString("user"); //vem como json string
    if (userData != null) {
      var res = UserModel.fromJson(jsonDecode(userData));
      Settings.user = res;
      user = res;
    }
  }
}
