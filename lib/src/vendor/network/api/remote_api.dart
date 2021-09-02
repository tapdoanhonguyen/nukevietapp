


import 'package:nukeviet/src/vendor/commons/utils.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/newsrow.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/user.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/nv_token.dart';

import 'api.dart';
class RemoteAPI implements API {
  RemoteAPI._();

  static final shared = RemoteAPI._();

  @override
  ApiType apiType = ApiType.remote;

  Future<NVToken> securityToken({String username, String password}) async {
    try {
      var res = await ApiMethod.getToken(
        username: username,
        password: password,
      );

      return NVToken.fromJson(res['message']);
    } catch (e) {
      throw e;
    }
  }

  Future<User> getUser({int userId}) async {
    final apiPath = ApiPath.getUser(userId);
    final Map<String, String> param = {};
    try {
      logger.info('get user');
      var res = await ApiMethod.getData(apiPath, param);
      logger.info(res);
      return User.fromJson(res);
    } catch (e) {
      throw e;
    }
  }
  Future<NewListPaging> getListNewsRow({
    Map<String, dynamic> params,
  }) async {
    try {
      var data = await ApiMethod.getData(ApiPath.getListNewsRow, params);
      return NewListPaging.fromJson(data);
    } catch (e) {
      throw e;
    }
  }

}



