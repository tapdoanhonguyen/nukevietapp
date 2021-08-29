import 'package:flutter/material.dart';
import 'package:nukeviet/src/include/base.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/user.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/vac_token.dart';

class LoginViewModel extends BaseViewModel {
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  ///
  String get username => usernameCtrl.text;
  String get password => passwordCtrl.text;

  bool get isValid => username.isNotEmpty && password.isNotEmpty;

  LoginViewModel() {
    usernameCtrl.text = r'anhtt';
    passwordCtrl.text = r'fds@22021';
  }

  Future<VacToken> login() async {
    return api.securityToken(username: username, password: password);
  }

  Future<User> getUser(int userId) async {
    return api.getUser(userId: userId);
  }
}
