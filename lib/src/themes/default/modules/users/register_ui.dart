import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nukeviet/src/modules/users/register_controller.dart';
import 'package:nukeviet/src/themes/default/color.dart';
import 'package:nukeviet/src/themes/default/custom_date_input_ui.dart';
import 'package:nukeviet/src/themes/default/custom_picker_input_ui.dart';
import 'package:nukeviet/src/vendor/components/custom_app_bar.dart';
import 'package:nukeviet/src/vendor/components/custom_form_input.dart';
import 'package:nukeviet/src/vendor/components/nv_button.dart';

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
      appBar: GradientAppBar(title: "Register Injection"),
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
                    controller: controller.nameCtrl,
                    labelText: 'Họ và tên',
                    required: true,
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
                rowInput([
                  CustomFormInput(
                    controller: controller.idCtrl,
                    labelText: 'Số CMND/CCCD',
                  ),
                  CustomFormInput(
                    controller: controller.bhytCtrl,
                    labelText: r'Số thẻ BHYT',
                  ),
                ]),
                rowInput([
                  CustomFormInput(
                    controller: controller.emailCtrl,
                    labelText: 'Email',
                  ),
                ]),
                rowInput([
                  CustomFormInput(
                    controller: controller.phoneCtrl,
                    keyboardType: TextInputType.phone,
                    labelText: r'Số điện thoại',
                  ),
                  CustomPickerInput(
                    controller: controller.groupCtrl,
                    mainContext: context,
                    label: r'Nhóm đối tượng',
                    searchPlaceholder: r'Nhập tên đối tượng',
                  ),
                ]),
                rowInput([
                  CustomPickerInput(
                    controller: controller.cityCtrl,
                    mainContext: context,
                    label: r'Tỉnh/Thành phố',
                    searchPlaceholder: r'Nhập tên Tình/Thành phố',
                    onSelectedData: (item) async {
                      var id = int.tryParse(item.id.toString());
                    },
                  ),
                ]),
                rowInput([
                  CustomPickerInput(
                    controller: controller.districtCtrl,
                    mainContext: context,
                    label: r'Quận/Huyện',
                    searchPlaceholder: r'Nhập tên Quận/Huyện',
                    onSelectedData: (item) async {
                      var id = int.tryParse(item.id.toString());
                    },
                  ),
                  CustomPickerInput(
                    controller: controller.wardCtrl,
                    mainContext: context,
                    label: r'Phường/Xã',
                    searchPlaceholder: r'Nhập tên Phường/Xã',
                  ),
                ]),
                rowInput([
                  CustomFormInput(
                    controller: controller.addressCtrl,
                    labelText: 'Địa chỉ nơi ở',
                  ),
                ]),
                rowInput([
                  CustomFormInput(
                    controller: controller.unitCtrl,
                    labelText: r'Đơn vị công tác',
                  ),
                ]),
                rowInput([
                  CustomPickerInput(
                    controller: controller.csytCtrl,
                    mainContext: context,
                    label: 'Cơ sở y tế',
                    searchPlaceholder: r'Nhập tên Cơ sở y tế',
                    onSelectedData: (item) async {
                      var id = int.tryParse(item.id.toString());
                    },
                  ),
                ]),
                rowInput([
                  CustomPickerInput(
                    controller: controller.localCtrl,
                    mainContext: context,
                    label: 'Địa bàn cơ sở',
                    searchPlaceholder: r'Nhập tên Địa bàn cở sở',
                  ),
                ]),
                rowInput([
                  CustomPickerInput(
                    controller: controller.danTocCtrl,
                    mainContext: context,
                    label: 'Dân tộc',
                    searchPlaceholder: r'Nhập tên dân tộc',
                  ),
                  CustomPickerInput(
                    controller: controller.quocTichCtrl,
                    mainContext: context,
                    label: r'Quốc tịch',
                    searchPlaceholder: r'Nhập tên quốc gia',
                  ),
                ]),
                rowInput([
                  CustomFormInput(
                    controller: controller.tieuSuCtrl,
                    labelText: r'Tiểu sử dị ứng',
                  ),
                ]),
                rowInput([
                  CustomFormInput(
                    controller: controller.benhLyCtrl,
                    labelText: r'Các bệnh lý đang mắc',
                  ),
                ]),
                rowInput([
                  CustomFormInput(
                    controller: controller.thuocCtrl,
                    labelText: r'Các thuốc đang dùng',
                  ),
                ]),
                rowInput([
                  CustomDateInput(
                    controller: controller.ngayDKCtrl,
                    label: r'Ngày đăng ký tiêm',
                  ),
                  SizedBox(),
                ]),
                rowInput([
                  CustomFormInput(
                    controller: controller.luuYCtrl,
                    labelText: 'Lưu ý',
                  ),
                ]),
                Container(
                  height: 54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NvButton(
                        title: r'Hủy',
                        color: AppColor.error,
                        onTap: () => Get.back(),
                      ),
                      SizedBox(width: 16),
                      NvButton(
                        title: r'Đăng ký tiêm',
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