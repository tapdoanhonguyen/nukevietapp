import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nukeviet/src/include/router.dart';
import 'package:nukeviet/src/modules/users/register_controller.dart';
import 'package:nukeviet/src/themes/default/color.dart';
import 'package:nukeviet/src/themes/default/custom_date_input_ui.dart';
import 'package:nukeviet/src/themes/default/custom_picker_input_ui.dart';
import 'package:nukeviet/src/vendor/components/custom_app_bar.dart';
import 'package:nukeviet/src/vendor/components/custom_form_input.dart';
import 'package:nukeviet/src/vendor/components/nv_button.dart';
import 'package:nukeviet/src/vendor/components/password_input.dart';

class Register extends StatelessWidget {
  final RegisterController controller =
  Get.put(RegisterController());
  Widget rowInput(List<Widget> inputList) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          inputList.length,
              (index) => Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: inputList[index],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: "Register"),
      body: Obx(
            () => Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              children: [
                Text("${controller.name}"),
                rowInput([
                  CustomFormInput(
                    controller: controller.firstnameCtrl,
                    labelText: 'Họ ',
                    required: true,
                  ),
                  CustomFormInput(
                    controller: controller.lastnameCtrl,
                    labelText: 'Tên',
                    required: true,
                  ),
                ]),

                rowInput([
                  CustomFormInput(
                    controller: controller.emailCtrl,
                    labelText: 'Email',
                  ),
                ]),
                rowInput([
                  CustomPickerInput(
                    controller: controller.genderCtrl,
                    mainContext: context,
                    label: r'Giới tính',
                  ),
                  CustomDateInput(
                    controller: controller.dobCtrl,
                    label: r'Ngày sinh',
                  ),
                ]),

                PasswordInput(
                  controller: controller.passwordCtrl,
                  label: 'Mật khẩu'.tr,
                ),
                PasswordInput(
                  controller: controller.passwordveryCtrl,
                  label: 'Nhập lại mật khẩu'.tr,
                ),

                Container(
                  height: 54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NvButton(
                        title: r'Hủy',
                        color: AppColor.error,
                        onTap: () => Get.offAndToNamed(GetRouter.login),
                      ),
                      SizedBox(width: 16),
                      NvButton(
                        title: r'Đăng ký',
                        color: AppColor.main,
                        icon: Icons.save,
                        onTap: () => controller.register(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

