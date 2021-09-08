import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nukeviet/src/include/base.dart';
import 'package:nukeviet/src/vendor/commons/utils.dart';
import 'package:nukeviet/src/vendor/components/custom_date_input/custom_date_input_controller.dart';
import 'package:nukeviet/src/vendor/components/custom_picker_input/custom_picker_input_controller.dart';
class RegisterController extends GetxController with BaseViewModel {
  var name = ''.obs;
  List<PickerItem> gender = [
    PickerItem(name: 'Nam', id: 0),
    PickerItem(name: 'Nữ', id: 1),
    PickerItem(name: 'Không xác định', id: 2),
  ];

  TextEditingController firstnameCtrl = TextEditingController();
  TextEditingController lastnameCtrl = TextEditingController();
  PickerController genderCtrl = PickerController();
  DatePickerController dobCtrl = DatePickerController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController passwordveryCtrl = TextEditingController();


  @override
  onInit() {
    super.onInit();
    genderCtrl.listData = gender;
    passwordCtrl.text = r'';
    Future.wait([
      CheckPass();
    ]);
  }



  ///
  register() {
    Map<String, dynamic> params = {
      "firstname": firstnameCtrl.text,
      "lastname": lastnameCtrl.text,
      "birthday": dobCtrl.text,
      "gender": genderCtrl.pickedID,
      "Email": emailCtrl.text,
      "TinhTrangDangKi": 1
    };
    logger.info(params);
  }

  CheckPass() {
    return RegisterController
  }
}