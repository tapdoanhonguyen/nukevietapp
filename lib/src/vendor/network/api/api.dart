library api;

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nukeviet/src/vendor/commons/utils.dart';
import 'package:nukeviet/src/vendor/network/exception.dart';
import 'package:nukeviet/src/vendor/network/global.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/newsrow.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/user.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/nv_token.dart';


export 'mock_api.dart';
export 'remote_api.dart';

part 'api_method.dart';

part 'api_path.dart';


enum ApiType { mock, remote }

abstract class API {
  ApiType apiType;

  Future<NVToken> securityToken({String username, String password});

  Future<User> getUser({int userId});


  Future<NewListPaging> getListNewsRow({
    Map<String, dynamic> params,
  });
}
