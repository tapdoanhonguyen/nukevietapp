import 'dart:convert';

import 'package:nukeviet/src/vendor/network/mock/mock.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/nguoitiemchung.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/newsrow.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/user.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/vac_token.dart';



import 'api.dart';

class MockAPI implements API {
  MockAPI._();

  static final shared = MockAPI._();

  @override
  ApiType apiType = ApiType.mock;

  Future<VacToken> securityToken({String username, String password}) async {
    var data = json.decode(mockToken);
    return VacToken.fromJson(data);
  }

  Future<User> getUser({int userId}) async {
    var data = json.decode(mockUser);
    return User.fromJson(data);
  }

  Future<InjectorPaging> getListNguoiTiemChung({
    Map<String, dynamic> params,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    var data = json.decode(mockNguoiTiemChung);
    return InjectorPaging.fromJson(data);
  }
  Future<NewListPaging> getListNewsRow({
    Map<String, dynamic> params,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    var data = json.decode(mockNewRow);
    return NewListPaging.fromJson(data);
  }
}