import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nukeviet/src/themes/default/modules/main/main_ui.dart';
import 'package:nukeviet/src/themes/default/modules/splash/splash_ui.dart';
import 'package:nukeviet/src/themes/default/modules/users/login_ui.dart';
import 'package:nukeviet/src/themes/default/modules/users/register_ui.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class GetRouter {
  static const root = '/';
  static const login = '/login';
  static const main = '/main';
  static const injector = '/injector';
  static const newInjector = '/new_injector';
  static const about = '/new_injector';
  static const users = '/new_injector';
  static const contact = '/new_injector';
  static const register= '/register';

  static List<GetPage> getPages() {
    return [
      GetPage(name: root, page: () => SplashPage()),
      GetPage(
        name: login,
        page: () => LoginPage(),
        transition: Transition.fade,
      ),
      GetPage(name: main, page: () => MainPage()),
      GetPage(name: register, page: () => Register()),
      //GetPage(name: about, page: () => AboutPage()),
      //GetPage(name: users, page: () => AboutPage()),
      //GetPage(name: contact, page: () => ContactPage()),
    ];
  }
}