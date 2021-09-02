import 'package:flutter/material.dart';
import 'package:nukeviet/src/include/base.dart';
import 'package:nukeviet/src/include/constants.dart';
import 'package:nukeviet/src/vendor/commons/utils.dart';
import 'package:nukeviet/src/vendor/network/global.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/user.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/nv_token.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class LoginViewModel extends BaseViewModel {
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  ///
  String get username => usernameCtrl.text;
  String get password => passwordCtrl.text;

  bool get isValid => username.isNotEmpty && password.isNotEmpty;

  LoginViewModel() {
    usernameCtrl.text = r'';
    passwordCtrl.text = r'';
  }

  Future<NVToken> login() async {
    Global.shared.timestamp = Timestamp.fromDate(DateTime.now()).seconds;
    Global.shared.setDataPost( 'users', 'Login');
    logger.info('res 1');
    return api.securityToken(username: username, password: password);
  }

  Future<User> getUser(int userId) async {
    logger.info(userId);
    Global.shared.timestamp = Timestamp.fromDate(DateTime.now()).seconds;
    Global.shared.setDataPost( 'users', 'UsersInfo');
    AppConstant.userId = userId.toString();
    return api.getUser(userId: userId);
  }
}
