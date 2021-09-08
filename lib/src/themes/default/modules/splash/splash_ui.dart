import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nukeviet/src/include/router.dart';
import '../../../../modules/users/login_vm.dart';
import 'package:nukeviet/src/vendor/commons/utils.dart';
import 'package:nukeviet/src/vendor/network/global.dart';


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final viewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    var userId = await Utils.getUserID();

    if (userId != null) {
      viewModel.getUser(userId).then((value) {
        Global.shared.saveUser(value);
        Get.offAndToNamed(GetRouter.main);
      }).catchError((e) => gotoLogin());
    } else {
      gotoLogin();
    }
  }

  gotoLogin() => Get.offNamed(GetRouter.login);

  gotoMain() => Get.offNamed(GetRouter.main);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(),
    );
  }
}